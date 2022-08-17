//
//  PreviewViewController.swift
//  AppPage
//
//  Created by Giwan Jo on 2022/08/17.
//

import UIKit

class PreviewViewController: UIViewController, UICollectionViewDataSource {
    private var dataSource: [String] = []
    private var firstIndexPath: IndexPath
    
    private lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.8)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: PreviewCell.identifier)
        
        return collectionView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.addTarget(self, action: #selector(closeButtonTouch(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycles
    init(dataSource: [String], at index: Int) {
        self.dataSource = dataSource
        self.firstIndexPath = IndexPath(item: index, section: 0)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async {
            self.mainCollectionView.scrollToItem(at: self.firstIndexPath, at: .centeredHorizontally, animated: false)
        }
    }
    // MARK: - Layout
    private func setupLayout() {
        view.addSubview(mainCollectionView)
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    // MARK: - Actions
    @objc func closeButtonTouch(_ sender: UIButton) {
        dismiss(animated: true)
    }
    // MARK: - Extension
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewCell.identifier, for: indexPath) as? PreviewCell else {
            return UICollectionViewCell()
        }
        let item = dataSource[indexPath.item]
        cell.prepare(image: item)
        return cell
    }
    
}
