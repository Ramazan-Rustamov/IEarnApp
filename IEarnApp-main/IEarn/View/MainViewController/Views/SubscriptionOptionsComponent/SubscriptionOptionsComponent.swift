//
//  SubscriptionOptionsComponent.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 19.08.22.
//

import UIKit

class SubscriptionOptionsComponent: UIView {
    
    private let viewModel = SubscriptionOptionsViewModel()
    
    private let subscriptionOptionsCollectionView = CollectionView<SubscriptionModel, SubscriptionOptionsCollectionViewCell>(data: [], direction: .vertical)
    
    private let proceedButton: CustomButton = {
       let button = CustomButton()
        button.title = "Продолжить"
        
        return button
    }()
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        
        setupSubviews()
        setupCollectionViewMethods()
        setupBindings()
    }
    
    private func setupSubviews() {
        addSubview(subscriptionOptionsCollectionView)
        addSubview(proceedButton)
        
        subscriptionOptionsCollectionView.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            subscriptionOptionsCollectionView.topAnchor.constraint(equalTo: topAnchor),
            subscriptionOptionsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subscriptionOptionsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            proceedButton.topAnchor.constraint(equalTo: subscriptionOptionsCollectionView.bottomAnchor, constant: 40),
            proceedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            proceedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            proceedButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        subscriptionOptionsCollectionView.contentDidChange = { [weak self] size in
            let collectionViewHeight: CGFloat = size.height
            let buttonHeight: CGFloat = 80
            let buttonTopConstant: CGFloat = 40
            self?.subscriptionOptionsCollectionView.heightAnchor.constraint(equalToConstant: collectionViewHeight).isActive = true
            self?.heightAnchor.constraint(equalToConstant: collectionViewHeight + buttonHeight + buttonTopConstant).isActive = true
        }
    }
    
    private func setupCollectionViewMethods() {
        subscriptionOptionsCollectionView.cellDequeueing = { [weak self] collectionView, cellID, indexPath in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? SubscriptionOptionsCollectionViewCell
            
            let cellData = self?.viewModel.getCellData(at: indexPath)
            
            cell?.data = cellData
            
            return cell ?? UICollectionViewCell()
        }
        
        subscriptionOptionsCollectionView.cellSelected = { [weak self] collectionView, indexPath in
            collectionView.visibleCells.forEach{ cell in
                if let eachCell = cell as? SubscriptionOptionsCollectionViewCell {
                    eachCell.isChosen = false
                }
            }
            if let cell = collectionView.cellForItem(at: indexPath) as? SubscriptionOptionsCollectionViewCell {
                cell.isChosen = true
            }
            self?.viewModel.cellSelected(at: indexPath)
        }
        
        subscriptionOptionsCollectionView.cellSize = .init(width: UIScreen.main.bounds.width - 40, height: 90)
        subscriptionOptionsCollectionView.spacing = 30
    }
    
    private func setupBindings() {
        viewModel.subscriptionOptionsData.bind { [weak self] data in
            self?.subscriptionOptionsCollectionView.data = data ?? []
        }
        viewModel.buttonTitle.bind { [weak self] title in
            self?.proceedButton.details = title
        }
    }
    
    func fetchSubscriptionData() {
        viewModel.imitatingSubscriptionOptionsData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
