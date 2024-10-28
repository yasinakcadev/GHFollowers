//
//  GFItemInfoVC.swift
//  GHFollowers
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 28.10.2024.
//

import UIKit

final class GFItemInfoVC: UIViewController {

    let stackView = UIStackView()
    let itemInfoViewOne = GFItemInfoView()
    let itemInfoViewTwo = GFItemInfoView()
    let actionButton = GFButton()
    
    let padding: CGFloat  = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layoutUI()
        configureStackView()
    }
    
    private func configure() {
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func configureStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)
    }
    
    private func layoutUI() {
        view.addSubview(stackView)
        view.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
