//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 29.10.2024.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        guard let user = user, let followersCount = user.followers, let followingCount = user.following else { return }
        itemInfoViewOne.set(type: .followers, withCount: followersCount)
        itemInfoViewTwo.set(type: .following, withCount: followingCount)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }

}
