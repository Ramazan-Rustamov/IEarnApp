//
//  CollectionViewCellDataModel.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 07.08.22.
//

import Foundation

struct SubscriptionOptionsCollectionViewCellDataModel {
    var initialPriceText: NSMutableAttributedString?
    var finalPriceText: String
    var freeUsagePeriod: String?
    var possibleDiscount: String?
    
    // Dependency Injection
    init(subscription: SubscriptionModel) {
        let crossedOutPrice: NSMutableAttributedString = NSMutableAttributedString(string: "\(subscription.initialPrice ?? 0) ₽")
        crossedOutPrice.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: crossedOutPrice.length))
        initialPriceText = crossedOutPrice
        finalPriceText = "\(subscription.finalPrice) " + "₽ /"  + " \(subscription.duration.timeUnit) \(subscription.duration.timeType.description)"
        if let trialPeriod = subscription.freeUsagePeriod {
            freeUsagePeriod = "Бесплатно первые \(trialPeriod.timeUnit) \(trialPeriod.timeType.description), а затем"
        }
        if let initialPrice = subscription.initialPrice {
            let interimValue = subscription.finalPrice.dividing(by: initialPrice)
            let interimPercentage = NSDecimalNumber(1).subtracting(interimValue)
            possibleDiscount = "Выгоднее на -\(Int(interimPercentage.multiplying(by: 100).doubleValue))%"
        }
    }
}
