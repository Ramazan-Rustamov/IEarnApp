//
//  SubscriptionOptionsViewModel.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 18.08.22.
//

import Foundation

class SubscriptionOptionsViewModel {
    
    var subscriptionOptionsData: ObservableObject<[SubscriptionModel]> = ObservableObject<[SubscriptionModel]>([])
    
    // MARK: Selected subscription data (not required in this project)
    // var selectedSubscription: ObservableObject<SubscriptionModel>?
    
    var buttonTitle: ObservableObject<String> = ObservableObject<String>("")
    
    func getCellData(at indexPath: IndexPath) -> SubscriptionOptionsCollectionViewCellDataModel? {
        guard let data = subscriptionOptionsData.value?[indexPath.item] else {return nil}
        return SubscriptionOptionsCollectionViewCellDataModel(subscription: data)
    }
    
    func cellSelected(at indexPath: IndexPath) {
        //selectedSubscription?.value = subscriptionOptionsData?.value?[indexPath.item]
        
        let cellData = getCellData(at: indexPath)
        buttonTitle.value = "\(cellData?.freeUsagePeriod ?? "") \(cellData?.finalPriceText ?? "")"
    }
    
    func imitatingSubscriptionOptionsData() {
        subscriptionOptionsData.value =
        [
            .init(initialPrice: nil, finalPrice: 2500, duration: .init(timeUnit: 3, timeType: .month), freeUsagePeriod: .init(timeUnit: 7, timeType: .day)),
            .init(initialPrice: 5000, finalPrice: 4500, duration: .init(timeUnit: 6, timeType: .month), freeUsagePeriod: nil),
            .init(initialPrice: 10000, finalPrice: 7500, duration: .init(timeUnit: 1, timeType: .year), freeUsagePeriod: nil),
            .init(initialPrice: 15000, finalPrice: 10500, duration: .init(timeUnit: 2, timeType: .year), freeUsagePeriod: nil)
        ]
    }
}
