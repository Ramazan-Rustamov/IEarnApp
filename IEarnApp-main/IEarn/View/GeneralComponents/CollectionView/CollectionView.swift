//
//  CollectionView.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 05.08.22.
//

import UIKit

class CollectionView<Data, CustomCollectionViewCell: UICollectionViewCell>: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var data: [Data] = [] {
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
    
    var cellDequeueing: ((UICollectionView, String, IndexPath) -> UICollectionViewCell?)?
    var cellSelected: ((UICollectionView, IndexPath) -> ())?
    var cellSize: CGSize = .init(width: UIScreen.main.bounds.width - 60, height: 50)
    var spacing: CGFloat = 30
    
    private let cellID = "cellID"
    
    init(data: [Data]? = [], direction: UICollectionView.ScrollDirection = .vertical) {
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = direction
        super.init(frame: .zero, collectionViewLayout: collectionViewLayout)
        
        dataSource = self
        delegate = self
        
        register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return cellDequeueing?(self, cellID ,indexPath) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellSelected?(self, indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
}





