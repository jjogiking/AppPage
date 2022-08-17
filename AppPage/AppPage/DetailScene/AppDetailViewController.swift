//
//  AppDetailViewController.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/11.
//

import UIKit

class AppDetailViewController: UIViewController {
    private(set) var viewModel: AppDetailViewModel
    
    private lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { section, env -> NSCollectionLayoutSection? in
            switch self.viewModel.dataSource[section] {
            case .headline:
                return self.getLayoutHeadlineSection()
            case .feature:
                return self.getLayoutFeatureSection()
            case .preview:
                return self.getLayoutPreviewSection()
            }
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = true
        collectionView.register(HeadlineCell.self, forCellWithReuseIdentifier: HeadlineCell.identifier)
        collectionView.register(FeatureCell.self, forCellWithReuseIdentifier: FeatureCell.identifier)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: PreviewCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        collectionView.register(FooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterView.identifier)
        
        return collectionView
    }()
    
    
    // MARK: - Life Cycles
    init(viewModel: AppDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupLayout()
    }
    // MARK: - Layout
    private func setupLayout() {
        view.addSubview(mainCollectionView)
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - Extension
extension AppDetailViewController: DropDownDelegate {
    func didDropDownButtonTouch(_ sender: UIButton) {
        UIView.animate(withDuration: 0.33, delay: 0, options: .curveEaseInOut) {
            self.mainCollectionView.collectionViewLayout.invalidateLayout()
            self.view.layoutIfNeeded()
        }
    }
}
