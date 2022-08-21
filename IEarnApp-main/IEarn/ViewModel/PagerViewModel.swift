//
//  PagerViewModel.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 06.08.22.
//

import UIKit.UIImage

class PagerViewModel {
    
    var pagerData: ObservableObject<[PagerSegmentDataModel]> = ObservableObject<[PagerSegmentDataModel]>([])
    
    func imitatingPagerData() {
        pagerData.value =
        [
            .init(upperTitle: "Рекомендуемый бюджет портфеля от 500 рублей", lowerTitle: "От 15 до 50 идей каждый месяц", upperIcon: UIImage(systemName: "wallet.pass"), lowerIcon: UIImage(systemName: "repeat")),
            .init(upperTitle: "Рекомендуемый бюджет портфеля от 700 рублей", lowerTitle: "От 50 до 100 идей каждый месяц", upperIcon: UIImage(systemName: "wallet.pass"), lowerIcon: UIImage(systemName: "repeat")),
            .init(upperTitle: "Рекомендуемый бюджет портфеля от 1000 рублей", lowerTitle: "От 100 до 150 идей каждый месяц", upperIcon: UIImage(systemName: "wallet.pass"), lowerIcon: UIImage(systemName: "repeat"))
        ]
    }
}
