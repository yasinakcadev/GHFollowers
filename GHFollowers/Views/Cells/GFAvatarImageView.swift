//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 8.10.2024.
//

import UIKit

final class GFAvatarImageView: UIImageView {
    
    private let placeholderImage = UIImage(named: "avatar-placeholder-dark")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        layer.cornerRadius = 10
        image = placeholderImage
    }
    
    func downloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if error != nil { return }
            guard let data = data, let image = UIImage(data: data), let self = self else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}
