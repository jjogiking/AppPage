//
//  FooterView.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/15.
//

import UIKit

final class FooterView: UICollectionReusableView {
    static let identifier = "FooterView"
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lineView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
