//
//  CollectionView.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 05.08.22.
//

import UIKit

class CollectionView: UICollectionView {
    
    var data: [SubscriptionModel] = [] {
        didSet {
            reloadData()
        }
    }
    
    override var contentSize: CGSize {
        didSet {
            contentDidChange?(contentSize)
        }
    }
    
    var contentDidChange: ((CGSize) -> Void)?
    
    var cellGenerator: ((UICollectionView, String, IndexPath) -> UICollectionViewCell?)?
    var cellSelectionHandler: ((UICollectionView, IndexPath) -> ())?
    var cellSize: CGSize = .zero
    var lineSpacing = CGFloat.zero
    
    private let cellID = "cellID"
    
    init() {
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: collectionViewLayout)
        
        dataSource = self
        delegate = self
        
        register(CollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return cellGenerator?(self, cellID ,indexPath) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellSelectionHandler?(self, indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        lineSpacing
    }

}
