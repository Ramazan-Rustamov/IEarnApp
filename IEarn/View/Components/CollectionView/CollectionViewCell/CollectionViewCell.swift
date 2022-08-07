//
//  CollectionViewCell.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 05.08.22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var data: CollectionViewCellDataModel? {
        get { nil }
        set {
            guard let value = newValue else {return}
            if let discount = newValue?.possibleDiscount, let initialPrice = newValue?.initialPrice {
                let crossedOutPrice: NSMutableAttributedString = NSMutableAttributedString(string: "\(initialPrice) ₽")
                crossedOutPrice.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: crossedOutPrice.length))
                initialPriceLabel.attributedText = crossedOutPrice
                finalPriceLabel.text = "\(value.finalPrice) ₽ / \(value.duration)"
                discountPercentageLabel.text = "Выгоднее на -\(Int(discount.doubleValue))%"
                discountPercentageLabel.backgroundColor = .link
            } else {
                finalPriceLabel.text = "\(value.finalPrice) ₽ / \(value.duration)"
                finalPriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
                additionalInfoLabel.bottomAnchor.constraint(equalTo: finalPriceLabel.topAnchor, constant: -5).isActive = true
            }
            if let freeUsagePeriod = newValue?.freeUsagePeriod {
                additionalInfoLabel.text = freeUsagePeriod
            } else {
                initialPriceLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
                finalPriceLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            }
        }
    }
    
    private let initialPriceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 26, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let finalPriceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 26, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let additionalInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let discountPercentageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let checkIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
        icon.tintColor = .white
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        return icon
    }()
    
    var isChosen: Bool = false {
        didSet {
            if isChosen {
                checkIcon.tintColor = UIColor.link
                layer.borderColor = UIColor.link.cgColor
            } else {
                checkIcon.tintColor = .white
                layer.borderColor = UIColor.darkGray.cgColor
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkGray
        layer.cornerRadius = 7
        layer.borderWidth = 2
        layer.borderColor = UIColor.darkGray.cgColor
        addSubview(initialPriceLabel)
        addSubview(finalPriceLabel)
        addSubview(discountPercentageLabel)
        addSubview(additionalInfoLabel)
        addSubview(checkIcon)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            initialPriceLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 8),
            initialPriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            finalPriceLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 8),
            finalPriceLabel.leadingAnchor.constraint(equalTo: initialPriceLabel.trailingAnchor, constant: 10),
            additionalInfoLabel.bottomAnchor.constraint(equalTo: initialPriceLabel.topAnchor, constant: -5),
            additionalInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            discountPercentageLabel.topAnchor.constraint(equalTo: topAnchor),
            discountPercentageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            checkIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            checkIcon.heightAnchor.constraint(equalToConstant: 18),
            checkIcon.widthAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
