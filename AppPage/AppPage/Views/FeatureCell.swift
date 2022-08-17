//
//  FeatureCell.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/16.
//

import UIKit

protocol DropDownDelegate: AnyObject {
    func didDropDownButtonTouch(_ sender: UIButton)
}

final class FeatureCell: UICollectionViewCell {
    weak var delegate: DropDownDelegate?
    static let identifier = "FeatureCell"
    static let minLines = 3
    
    private lazy var dropDownButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("더보기", for: .normal)
        button.addTarget(self, action: #selector(didDropDownButtonTouch(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = FeatureCell.minLines
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
        contentView.addSubview(dropDownButton)
        dropDownButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropDownButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            dropDownButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        prepare(titleText: nil, descText: nil)
    }
    
    func prepare(titleText: String?, descText: String?) {
        self.titleLabel.text = titleText
        self.descriptionLabel.text = descText
    }
    
    @objc func didDropDownButtonTouch(_ sender: UIButton) {
        sender.isSelected.toggle()
        descriptionLabel.numberOfLines = sender.isSelected ? 0 : FeatureCell.minLines
        delegate?.didDropDownButtonTouch(sender)
    }
}
