//
//  UserInfoVC.swift
//  GHFollowers
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 16.10.2024.
//

import UIKit

final class UserInfoVC: UIViewController {
    
    var username: String

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "DONE", style: .done, target: self, action: #selector(dismissModal))
        getUser()
    }
    
    init(username: String) {
        self.username = username
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dismissModal() {
        dismiss(animated: true)
    }
    
    func getUser() {
        NetworkManager.shared.getUser(username: self.username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                break
            case .failure(let error):
                break
            }
        }
    }
}
