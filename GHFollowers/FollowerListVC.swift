//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 22.09.2024.
//

import UIKit

class FollowerListVC: UIViewController {

    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
