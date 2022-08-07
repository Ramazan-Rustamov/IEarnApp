//
//  CollectionViewCellDataModel.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 07.08.22.
//

import Foundation

struct CollectionViewCellDataModel {
    var initialPrice: NSDecimalNumber?
    var finalPrice: NSDecimalNumber
    var duration: String
    var freeUsagePeriod: String?
    var possibleDiscount: NSDecimalNumber?
    
    init(subscription: SubscriptionModel) {
        initialPrice = subscription.initialPrice
        finalPrice = subscription.finalPrice
        duration = "\(subscription.duration.timeUnit) \(subscription.duration.timeType.description)"
        if let trialPeriod = subscription.freeUsagePeriod {
            freeUsagePeriod = "Бесплатно первые \(trialPeriod.timeUnit) \(trialPeriod.timeType.description), а затем"
        }
        if let initialPrice = subscription.initialPrice {
            let interimValue = finalPrice.dividing(by: initialPrice)
            let interimPercentage = NSDecimalNumber(1).subtracting(interimValue)
            possibleDiscount = interimPercentage.multiplying(by: 100)
        }
    }
}
