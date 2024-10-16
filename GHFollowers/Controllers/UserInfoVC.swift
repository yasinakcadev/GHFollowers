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
}
