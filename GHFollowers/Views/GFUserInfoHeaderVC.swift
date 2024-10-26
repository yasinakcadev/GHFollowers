//
//  GFUserInfoHeaderVC.swift
//  GHFollowers
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 26.10.2024.
//

import UIKit

final class GFUserInfoHeaderVC: UIViewController {

    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = GFSecondaryLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = GFSecondaryLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)
    
    var user: User?
    let outerPadding: CGFloat = 20
    let innerPadding: CGFloat = 12
    
    init(user: User?) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureElements()
    }
    
    func configureElements() {
        guard let user = user, let url = user.avatarUrl else { return }
        avatarImageView.downloadImage(from: url)
        usernameLabel.text = user.login
        nameLabel.text = user.name
        bioLabel.text = user.bio
        locationImageView.image = UIImage(systemName: "mappin.and.ellipse")
        locationLabel.text = user.location
    }
    
    func setupUI() {
        setupAvatarImageView()
        setupUsernameLabel()
        setupNameLabel()
        setupLocationImageViewAndLabel()
        setupBioLabel()
    }
    
    func setupAvatarImageView() {
        view.addSubview(avatarImageView)
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: outerPadding),
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: outerPadding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func setupUsernameLabel() {
        view.addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: innerPadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
    func setupNameLabel() {
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: innerPadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setupLocationImageViewAndLabel() {
        view.addSubview(locationImageView)
        view.addSubview(locationLabel)
        
        locationImageView.tintColor = .secondaryLabel
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: innerPadding),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            
            locationLabel.topAnchor.constraint(equalTo: locationImageView.topAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: innerPadding),
            locationLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: -outerPadding),
            locationLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setupBioLabel() {
        view.addSubview(bioLabel)
        bioLabel.numberOfLines = 3
        
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: innerPadding),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: outerPadding),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -outerPadding),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
