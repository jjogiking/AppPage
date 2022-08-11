//
//  SearchViewController.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/11.
//

import UIKit

class SearchViewController: UIViewController {

    private lazy var appIdTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "APP_ID를 입력하세요."
        textField.clearButtonMode = .always
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
 
    private func setupLayout() {
        view.addSubview(appIdTextField)
        appIdTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appIdTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appIdTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            appIdTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            appIdTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        view.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.topAnchor.constraint(equalTo: appIdTextField.bottomAnchor, constant: 8),
            submitButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            submitButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
