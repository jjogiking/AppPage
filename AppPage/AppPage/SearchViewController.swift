//
//  SearchViewController.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/11.
//

import Combine
import UIKit

class SearchViewController: UIViewController {
    var viewModel = SearchViewModel()
    var cancelBag = Set<AnyCancellable>()
    
    private lazy var appIdTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "APP_ID를 입력하세요. ex) 872469884"
        textField.clearButtonMode = .always
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTouchSubmitButton(_:)), for: .touchUpInside)
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
    
    @objc func didTouchSubmitButton(_ sender: UIButton) {
        guard let id = appIdTextField.text,
              id.isEmpty == false
        else {
            return
        }
        
        viewModel.requestAppData()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print(#function, #line)
                    // TODO: 다음 화면 출력
                }
            } receiveValue: { details in
                print(details)
            }
            .store(in: &cancelBag)
    }
}
