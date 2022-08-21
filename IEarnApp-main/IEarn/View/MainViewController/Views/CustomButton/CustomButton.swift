//
//  CustomButton.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 05.08.22.
//

import UIKit

class CustomButton: UIView {
    
    private let proceedLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let additionalInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var title: String? {
        get {proceedLabel.text}
        set {proceedLabel.text = newValue}
    }
    
    var details: String? {
        get { additionalInfoLabel.text }
        set { additionalInfoLabel.text = newValue }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .link
        layer.cornerRadius = 7
        
        addSubview(proceedLabel)
        addSubview(additionalInfoLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            proceedLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            proceedLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            additionalInfoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            additionalInfoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
