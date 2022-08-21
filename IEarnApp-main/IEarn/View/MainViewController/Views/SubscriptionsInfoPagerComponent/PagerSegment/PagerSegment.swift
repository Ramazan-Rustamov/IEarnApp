//
//  PagerSegment.swift
//  IEarn
//
//  Created by Ramazan Rustamov on 05.08.22.
//

import UIKit

class PagerSegment: UIViewController {
    
    private let firstLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let secondLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let firstImageView: UIImageView = {
       let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        return icon
    }()
    
    private let secondImageView: UIImageView = {
       let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        return icon
    }()
    
    var firstLabelValue: String? {
        get { firstLabel.text }
        set { firstLabel.text = newValue }
    }
    
    var secondLabelValue: String? {
        get { secondLabel.text }
        set { secondLabel.text = newValue }
    }
    
    var firstIcon: UIImage? {
        get { firstImageView.image }
        set { firstImageView.image = newValue }
    }
    
    var secondIcon: UIImage? {
        get { secondImageView.image }
        set { secondImageView.image = newValue }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(firstImageView)
        view.addSubview(secondImageView)
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            firstImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            firstImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstImageView.heightAnchor.constraint(equalToConstant: 18),
            firstImageView.widthAnchor.constraint(equalToConstant: 18),
            secondImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            secondImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondImageView.heightAnchor.constraint(equalToConstant: 18),
            secondImageView.widthAnchor.constraint(equalToConstant: 18),
            firstLabel.centerYAnchor.constraint(equalTo: firstImageView.centerYAnchor),
            firstLabel.leadingAnchor.constraint(equalTo: firstImageView.trailingAnchor, constant: 10),
            firstLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            secondLabel.centerYAnchor.constraint(equalTo: secondImageView.centerYAnchor),
            secondLabel.leadingAnchor.constraint(equalTo: secondImageView.trailingAnchor, constant: 10),
            secondLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20)
        ])
    }
    
}
