//
//  UIViewController+Extension.swift
//  GHFollowers
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 3.10.2024.
//

import UIKit

extension UIViewController {
    
    func showAlertOnMainThread(alertTitle: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async { [weak self] in
            let vc = GFAlertVC(alertTitle: alertTitle, message: message, buttonTitle: buttonTitle)
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            self?.present(vc, animated: true)
        }
    }
}
