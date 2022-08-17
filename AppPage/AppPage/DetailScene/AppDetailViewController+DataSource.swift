//
//  AppDetailViewController+DataSource.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/17.
//

import UIKit

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
