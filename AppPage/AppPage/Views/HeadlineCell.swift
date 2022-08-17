//
//  HeadlineCell.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/15.
//

import UIKit

final class HeadlineCell: UICollectionViewCell {
    static let identifier = "HeadlineCell"
    
    private let imageView = CustomImageView()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.8),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.imageView.rightAnchor),
            titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: self.imageView.rightAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        prepare(image: nil, titleText: nil, descText: nil)
    }
    
    func prepare(image: String?, titleText: String?, descText: String?) {
        if let image = image,
           let url = URL(string: image) {
            self.imageView.setImage(url: url)
        }
        self.titleLabel.text = titleText
        self.descriptionLabel.text = descText
    }
}

