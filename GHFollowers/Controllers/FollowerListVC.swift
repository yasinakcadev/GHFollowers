//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 22.09.2024.
//

import UIKit

final class FollowerListVC: UIViewController {
    
    enum Section {
        case main
    }

    var userName: String
    var collectionView: UICollectionView?
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>?
    var followers: [Follower] = []
    var filteredFollowers: [Follower] = []
    var page = 1
    var hasMoreFollowers: Bool = true
    
    init(username: String) {
        self.userName = username
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = userName
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = false
        configureSearchController()
        configureCollectionView()
        getFollowers(username: self.userName, page: self.page)
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func getFollowers(username: String, page: Int) {
        showLoadingIndicator()
        NetworkManager.shared.getFollowers(username: username, page: page) { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
            case .success(var followers):
                if followers.count < 100 { self.hasMoreFollowers = false }
                if followers.isEmpty {
                    DispatchQueue.main.async {
                        self.showEmptyStateView(with: "The user has no follower. Go follow them 😃", in: self.view)
                    }
                    return
                }
                self.followers.append(contentsOf: followers)
                self.applySnapshot(for: followers)
            case .failure(let error):
                self.showAlertOnMainThread(alertTitle: "Ops!", message: error.localizedDescription, buttonTitle: "OKAY")
            }
        }
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        guard let collectionView = collectionView else { return }
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.identifier)
    }
    
    func configureDataSource() {
        guard let collectionView = self.collectionView else { return }
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.identifier, for: indexPath) as? FollowerCell
            cell?.populate(for: follower)
            return cell
        })
    }
    
    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Enter a username"
        navigationItem.searchController = searchController
    }
    
    func applySnapshot(for follower: [Follower]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(follower)
        DispatchQueue.main.async { [weak self] in
            self?.dataSource?.apply(snapshot, animatingDifferences: true)
        }
    }
}

extension FollowerListVC: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y            // ScrollView'ın dikeyde nerde oldugunu temsil eder
        let contentHeight = scrollView.contentSize.height   // ScrollView içindeki içerigin toplam yuksekligini temsil eder. ScrollView'in kaydirilabilir alanının yüksekligidir.
        let height = scrollView.frame.size.height           // ScrollView'in gorunen alanının yuksekligidir. Yani kullanıcının ekran gordugu alanın boyutunu temsil eder.
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers else { return }
            self.page += 1
            getFollowers(username: userName, page: page)
        }
    }
}

extension FollowerListVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filtered = searchController.searchBar.text, !filtered.isEmpty else {
            applySnapshot(for: self.followers)
            return
        }
        filteredFollowers = followers.filter { $0.login.lowercased().contains(filtered.lowercased()) }
        applySnapshot(for: filteredFollowers)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        applySnapshot(for: self.followers)
    }
}
