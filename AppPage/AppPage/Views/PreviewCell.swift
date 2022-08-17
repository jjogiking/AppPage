//
//  PreviewCell.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/16.
//

import UIKit

final class PreviewCell: UICollectionViewCell {
    static let identifier = "PreviewCell"
    
    private let imageView = CustomImageView()
   
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        prepare(image: nil)
    }
    
    func prepare(image: String?) {
        if let image = image,
           let url = URL(string: image) {
            self.imageView.setImage(url: url)
        } else {
            self.imageView.cancel()
            self.imageView.image = nil
        }
    }
}
