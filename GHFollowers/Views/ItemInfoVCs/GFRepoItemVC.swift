//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 29.10.2024.
//

import UIKit

final class GFRepoItemVC: GFItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        guard let user = user, let repoCount = user.publicRepos, let gistsCount = user.publicGists else { return }
        itemInfoViewOne.set(type: .repos, withCount: repoCount)
        itemInfoViewTwo.set(type: .gists, withCount: gistsCount)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
}
