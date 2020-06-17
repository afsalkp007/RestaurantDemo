//
//  LocationViewController.swift
//  RestaurantApp
//
//  Created by Afsal's Macbook Pro on 12/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit

protocol LocationActions: class {
    func didTapAllow()
}

class LocationViewController: UIViewController {
    
    @IBOutlet weak var locationView: LocationView!
    weak var delegate: LocationActions?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationView.didTapAllow = { 
            self.delegate?.didTapAllow()
        }
            
       
    }
}
