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
        
        addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 30),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
