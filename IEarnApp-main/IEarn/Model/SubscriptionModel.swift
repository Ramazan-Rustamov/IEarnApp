//
//  SubscriptionModel.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 05.08.22.
//

import Foundation

struct SubscriptionModel {
    let initialPrice: NSDecimalNumber?
    let finalPrice: NSDecimalNumber
    let duration: Duration
    let freeUsagePeriod: Duration?
}

struct Duration {
    let timeUnit: Int
    let timeType: TimeType
}

enum TimeType {
    case day
    case week
    case month
    case year
    
    var description: String {
        switch self {
        case .day:
            return "день"
        case .week:
            return "неделя"
        case .month:
            return "месяц"
        case .year:
            return "год"
        }
    }
}
