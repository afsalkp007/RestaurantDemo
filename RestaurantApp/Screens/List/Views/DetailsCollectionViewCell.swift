//
//  DetailsCollectionViewCell.swift
//  RestaurantApp
//
//  Created by Afsal's Macbook Pro on 29/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit

class DetailsCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        imageView.pin()
        
    }
}

extension UIView {
    func pin() {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: topAnchor),
            self.bottomAnchor.constraint(equalTo: bottomAnchor),
            self.rightAnchor.constraint(equalTo: rightAnchor),
            self.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
}
