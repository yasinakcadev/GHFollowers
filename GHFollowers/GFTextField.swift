//
//  GFTextField.swift
//  GHFollowers
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 22.09.2024.
//

import UIKit

final class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        
        placeholder = "Enter a username"
        returnKeyType = .go
        inputAccessoryView = createToolbarView()
    }
    
    private func createToolbarView() -> UIView {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "DONE", style: .done, target: self, action: #selector(hideKeyboard))
        let flexSpace = UIBarButtonItem(systemItem: .flexibleSpace)
        
        toolbar.items = [flexSpace, doneButton]
        return toolbar
    }
    
    @objc func hideKeyboard() {
        endEditing(true)
    }
}
