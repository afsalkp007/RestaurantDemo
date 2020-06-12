//
//  LocationView.swift
//  RestaurantApp
//
//  Created by Afsal's Macbook Pro on 12/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit

@IBDesignable  class LocationView: BaseView {
    
    
    @IBOutlet weak var allowButton: UIButton!
    @IBOutlet weak var denyButton: UIButton!
    
    var didTapAllow: (() -> Void)?
    
    @IBAction func allowAction(_ sender: UIButton ) {
        didTapAllow?()
    }
    
    @IBAction func denyAction(_ sender: UIButton ) {
        
    }

}
