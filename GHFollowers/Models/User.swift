//
//  User.swift
//  GHFollowers
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 3.10.2024.
//

import Foundation

struct User: Codable {
    let login: String?
    var avatarUrl: String?
    var name: String?
    var location: String?
    var bio: String?
    let publicRepos: Int?
    let publicGists: Int?
    let htmlUrl: String?
    let following: Int?
    let followers: Int?
    let createdAt: String?
}
