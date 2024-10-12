//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 8.10.2024.
//

import UIKit

final class GFAvatarImageView: UIImageView {
    
    private let placeholderImage = UIImage(named: "avatar-placeholder-dark")
    let cache = NetworkManager.shared.cache

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
        if let cachedImage = cache.object(forKey: NSString(string: urlString)) {
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if error != nil { return }
            guard let data = data, let image = UIImage(data: data), let self = self else { return }
            self.cache.setObject(image, forKey: NSString(string: urlString))
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}
