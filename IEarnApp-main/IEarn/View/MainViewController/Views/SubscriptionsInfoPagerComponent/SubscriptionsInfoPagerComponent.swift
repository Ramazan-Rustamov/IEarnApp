//
//  SubscriptionsInfoPagerComponent.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 19.08.22.
//

import UIKit

class SubscriptionsInfoPagerComponent: UIView {
    
    private let viewModel = PagerViewModel()
    
    private let pagerComponent: PagerComponent = PagerComponent()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        
        setupSubviews()
        setupBindings()
    }
    
    private func setupSubviews() {
        addSubview(pagerComponent.view)
        
        NSLayoutConstraint.activate([
            pagerComponent.view.topAnchor.constraint(equalTo: topAnchor),
            pagerComponent.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            pagerComponent.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            pagerComponent.view.bottomAnchor.constraint(equalTo: bottomAnchor),
            pagerComponent.view.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupBindings() {
        viewModel.pagerData.bind { [weak self] pagerData in
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
    }
    
    func fetchPagerData() {
        viewModel.imitatingPagerData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
