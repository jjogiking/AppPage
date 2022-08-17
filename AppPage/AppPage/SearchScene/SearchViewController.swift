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
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setupLayout()
    }
    // MARK: - Layout
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
    // MARK: - Actions
    private func presentErrorAlert(message: String) {
        let alertController = UIAlertController(title: "오류", message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Close", style: .cancel)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
    
    @objc func didTouchSubmitButton(_ sender: UIButton) {
        guard let id = appIdTextField.text,
              id.isEmpty == false
        else {
            return
        }
        
        viewModel.requestAppData(id: id)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.presentErrorAlert(message: error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] details in
                guard let self = self else {
                    return
                }
                
                let second = AppDetailViewController(viewModel: AppDetailViewModel(details))
                self.navigationController?.pushViewController(second, animated: true)
            }
            .store(in: &cancelBag)
    }
}
