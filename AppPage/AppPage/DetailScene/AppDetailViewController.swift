//
//  AppDetailViewController.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/11.
//

import UIKit

class AppDetailViewModel {
    private(set) var dataSource: [AppSection] = []
    
    init(_ detail: Detail) {
        dataSource = [
            .headline(
                .init(
                    image: detail.artworkUrl100,
                    title: detail.trackName,
                    desc: detail.artistName
                )
            ),
            .feature(
                .init(
                    title: detail.releaseNotes,
                    desc: detail.resultDescription
                )
            ),
            .preview(
                detail.screenshotUrls.map {
                    .init(image: $0)
                }
            )
        ]
    }
}

class AppDetailViewController: UIViewController {
    private var viewModel: AppDetailViewModel
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupLayout()
    }
    
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
    
    init(viewModel: AppDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppDetailViewController {
    func getLayoutHeadlineSection() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let footerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(10)
        )
        let footer = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerSize,
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom
        )
        
        // group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.15)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [footer]
        return section
    }
    
    func getLayoutFeatureSection() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(100)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(40)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let footerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(10)
        )
        let footer = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerSize,
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom
        )
        
        // group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(100)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header, footer]
        return section
    }
    
    func getLayoutPreviewSection() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(40)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        // group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.8),
            heightDimension: .fractionalHeight(0.6)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
}

extension AppDetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch viewModel.dataSource[indexPath.section] {
        case .preview(let previews):
            let dataSource = previews.map { $0.image }
            let previewViewController = PreviewViewController(dataSource: dataSource, at: indexPath.item)
            previewViewController.modalPresentationStyle = .fullScreen
            present(previewViewController, animated: true)
        default:
            break
        }
    }
}

extension AppDetailViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.viewModel.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch viewModel.dataSource[section] {
        case .headline(_):
            return 1
        case .feature(_):
            return 1
        case .preview(let previews):
            return previews.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch viewModel.dataSource[indexPath.section] {
        case .headline(let item):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeadlineCell.identifier, for: indexPath) as! HeadlineCell
            cell.prepare(image: item.image, titleText: item.title, descText: item.desc)
            return cell
        case .feature(let item):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeatureCell.identifier, for: indexPath) as! FeatureCell
            cell.prepare(titleText: item.title, descText: item.desc)
            cell.delegate = self
            return cell
        case .preview(let previews):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewCell.identifier, for: indexPath) as! PreviewCell
            let item = previews[indexPath.item]
            cell.prepare(image: item.image)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: HeaderView.identifier,
                for: indexPath
            ) as! HeaderView
            let title = viewModel.dataSource[indexPath.section].descriptionName
            headerView.prepare(titleText: title)
            return headerView
        case UICollectionView.elementKindSectionFooter:
            return collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: FooterView.identifier,
                for: indexPath
            )
        default:
            return UICollectionReusableView()
        }
    }
}

extension AppDetailViewController: DropDownDelegate {
    func didDropDownButtonTouch(_ sender: UIButton) {
        UIView.animate(withDuration: 0.33, delay: 0, options: .curveEaseInOut) {
            self.mainCollectionView.collectionViewLayout.invalidateLayout()
            self.view.layoutIfNeeded()
        }
    }
}
