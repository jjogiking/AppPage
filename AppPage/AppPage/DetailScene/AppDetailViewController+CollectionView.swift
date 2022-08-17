//
//  AppDetailViewController+CollectionView.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/17.
//

import UIKit

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
