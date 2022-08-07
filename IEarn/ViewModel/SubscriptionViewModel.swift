//
//  SubscriptionViewModel.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 06.08.22.
//

import UIKit

class SubscriptionViewModel {
    
    private var pagerData: [PagerSegmentDataModel]? {
        didSet {
            pagerDataHandler?(pagerData)
        }
    }
    
    private var subsriptionOptionsData: [SubscriptionModel]? {
        didSet {
            subscriptionOptionsDataHandler?(subsriptionOptionsData)
        }
    }
    
    var selectedSubscription: SubscriptionModel? {
        didSet {
            guard let data = selectedSubscription else { return }
            selectedSubscriptionHandler?(data)
            if let freeUsagePeriod = selectedSubscription?.freeUsagePeriod {
                customButtonTitleHandler?("Бесплатно первые \(freeUsagePeriod.timeUnit) \(freeUsagePeriod.timeType.description), а затем \(data.finalPrice) ₽ / \(data.duration.timeUnit) \(data.duration.timeType.description)")
            } else {
                customButtonTitleHandler?("\(data.finalPrice) ₽ / \(data.duration.timeUnit) \(data.duration.timeType.description)")
            }
            
        }
    }
    
    var customButtonTitleHandler: ((String?) -> Void)?
    
    var selectedSubscriptionHandler: ((SubscriptionModel?) -> Void)?
    
    var pagerDataHandler: (([PagerSegmentDataModel]?) -> Void)?
    
    var subscriptionOptionsDataHandler: (([SubscriptionModel]?) -> Void)?
    
    init() {
        imitatingPagerData()
        imitatingSubscriptionOptionsData()
    }
    
    func imitatingPagerData() {
        pagerData =
        [
            .init(upperTitle: "Рекомендуемый бюджет портфеля от 500 рублей", lowerTitle: "От 15 до 50 идей каждый месяц", upperIcon: UIImage(systemName: "wallet.pass"), lowerIcon: UIImage(systemName: "repeat")),
            .init(upperTitle: "Рекомендуемый бюджет портфеля от 700 рублей", lowerTitle: "От 50 до 100 идей каждый месяц", upperIcon: UIImage(systemName: "wallet.pass"), lowerIcon: UIImage(systemName: "repeat")),
            .init(upperTitle: "Рекомендуемый бюджет портфеля от 1000 рублей", lowerTitle: "От 100 до 150 идей каждый месяц", upperIcon: UIImage(systemName: "wallet.pass"), lowerIcon: UIImage(systemName: "repeat"))
        ]
    }
    
    func imitatingSubscriptionOptionsData() {
        subsriptionOptionsData =
        [
            .init(initialPrice: nil, finalPrice: 2500, duration: .init(timeUnit: 3, timeType: .month), freeUsagePeriod: .init(timeUnit: 7, timeType: .day)),
            .init(initialPrice: 5000, finalPrice: 4500, duration: .init(timeUnit: 6, timeType: .month), freeUsagePeriod: nil),
            .init(initialPrice: 10000, finalPrice: 7500, duration: .init(timeUnit: 1, timeType: .year), freeUsagePeriod: nil),
            .init(initialPrice: 15000, finalPrice: 10500, duration: .init(timeUnit: 2, timeType: .year), freeUsagePeriod: nil)
        ]
    }
    
    
    
}
