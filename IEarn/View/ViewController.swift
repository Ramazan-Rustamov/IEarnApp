//
//  ViewController.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 05.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: ViewModel
    
    private let viewModel = SubscriptionViewModel()
    
    // MARK: Setting up scroll view
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.bounces = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let contentView: UIView = {
       let background = UIView()
       background.backgroundColor = .clear
       background.translatesAutoresizingMaskIntoConstraints = false
       
        
        return background
    }()
    
    // MARK: PagerComponent
    
    private lazy var pagerComponent: PagerComponent = {
       let pageController = PagerComponent()
        
        return pageController
    }()
    
    // MARK: CollectionView
    
    private var collectionViewData: [SubscriptionModel] = [] {
        didSet {
            customCollectionView.data = collectionViewData
        }
    }
    
    private lazy var customCollectionView: CollectionView = {
       let view = CollectionView()
        view.cellGenerator = { [weak self] collectionView, cellID, indexPath in
            guard let self = self else { return UICollectionViewCell() }
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? CollectionViewCell
            cell?.data = CollectionViewCellDataModel(subscription: self.collectionViewData[indexPath.item])
            
            return cell ?? UICollectionViewCell()
        }
        view.cellSelectionHandler = { [weak self] collectionView, indexPath in
            collectionView.visibleCells.forEach{ cell in
                if let eachCell = cell as? CollectionViewCell {
                            eachCell.isChosen = false
                        }
            }
            if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {
                        cell.isChosen = true
                    }
            self?.viewModel.selectedSubscription = self?.collectionViewData[indexPath.item]
        }
        view.cellSize = .init(width: self.view.frame.width - 40, height: 90)
        view.lineSpacing = 30
        view.backgroundColor = .black
        
        return view
    }()
    
    // MARK: Subscribe Button
    
    private let customButton: CustomButton = CustomButton()
    
    // MARK: Lower buttons (as functionality is not known , I will use labels)
    
    private let recoverSubscriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Восстановить подписку"
        label.numberOfLines = 1
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let confidentialityPolicyLabel: UILabel = {
        let label = UILabel()
        label.text = "Политика конфиденциальности"
        label.numberOfLines = 1
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let policyRulesLabel: UILabel = {
        let label = UILabel()
        label.text = "Правила пользования"
        label.numberOfLines = 1
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(pagerComponent.view)
        contentView.addSubview(customCollectionView)
        contentView.addSubview(customButton)
        contentView.addSubview(recoverSubscriptionLabel)
        contentView.addSubview(confidentialityPolicyLabel)
        contentView.addSubview(policyRulesLabel)
        
        updateUI()
        fetchData()
        
        activateConstraints()
    }
    
    private func updateUI() {
        viewModel.pagerDataHandler = { [weak self] pagerData in
            guard let self = self, let pagerData = pagerData else { return }
            
            var viewControllers: [UIViewController] = []
            
            pagerData.forEach {
                let segment = PagerSegment()
                segment.firstLabelValue = $0.upperTitle
                segment.secondLabelValue = $0.lowerTitle
                segment.firstIcon = $0.upperIcon
                segment.secondIcon = $0.lowerIcon
                
                viewControllers.append(segment)
            }
            
            self.pagerComponent.segments = viewControllers
        }
        
        viewModel.subscriptionOptionsDataHandler = { [weak self] subscriptionData in
            guard let self = self, let subscriptionData = subscriptionData else { return }
            self.collectionViewData = subscriptionData
        }
        
        viewModel.customButtonTitleHandler = { [weak self] subscription in
            self?.customButton.details = subscription
        }
    }
    
    private func fetchData() {
        viewModel.imitatingPagerData()
        viewModel.imitatingSubscriptionOptionsData()
    }


    private func activateConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            pagerComponent.view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            pagerComponent.view.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -30),
            pagerComponent.view.heightAnchor.constraint(equalToConstant: 100),
            customCollectionView.topAnchor.constraint(equalTo: pagerComponent.view.bottomAnchor, constant: 80),
            customCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            customButton.topAnchor.constraint(equalTo: customCollectionView.bottomAnchor, constant: 40),
            customButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            customButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            customButton.heightAnchor.constraint(equalToConstant: 70),
            recoverSubscriptionLabel.topAnchor.constraint(equalTo: customButton.bottomAnchor, constant: 40),
            recoverSubscriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            confidentialityPolicyLabel.topAnchor.constraint(equalTo: recoverSubscriptionLabel.bottomAnchor, constant: 20),
            confidentialityPolicyLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            policyRulesLabel.topAnchor.constraint(equalTo: confidentialityPolicyLabel.bottomAnchor, constant: 20),
            policyRulesLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            policyRulesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        customCollectionView.contentDidChange = { [weak self] size in
            self?.customCollectionView.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}

