//
//  ViewController.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 05.08.22.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    private let pagerComponent: SubscriptionsInfoPagerComponent = SubscriptionsInfoPagerComponent()
      
    // MARK: CollectionView and Proceed Button
    
    private let subscriptionOptionsComponent: SubscriptionOptionsComponent = SubscriptionOptionsComponent()
    
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
        setupSubviews()
        fetchData()
    }

    private func fetchData() {
        pagerComponent.fetchPagerData()
        subscriptionOptionsComponent.fetchSubscriptionData()
    }

    private func setupSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(pagerComponent)
        contentView.addSubview(subscriptionOptionsComponent)
        contentView.addSubview(recoverSubscriptionLabel)
        contentView.addSubview(confidentialityPolicyLabel)
        contentView.addSubview(policyRulesLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            pagerComponent.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            pagerComponent.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -30),
            subscriptionOptionsComponent.topAnchor.constraint(equalTo: pagerComponent.bottomAnchor, constant: 40),
            subscriptionOptionsComponent.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            recoverSubscriptionLabel.topAnchor.constraint(equalTo: subscriptionOptionsComponent.bottomAnchor, constant: 40),
            recoverSubscriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            confidentialityPolicyLabel.topAnchor.constraint(equalTo: recoverSubscriptionLabel.bottomAnchor, constant: 20),
            confidentialityPolicyLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            policyRulesLabel.topAnchor.constraint(equalTo: confidentialityPolicyLabel.bottomAnchor, constant: 20),
            policyRulesLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            policyRulesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}

