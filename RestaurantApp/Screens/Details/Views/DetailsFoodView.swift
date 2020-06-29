//
//  DetailsFoodView.swift
//  RestaurantApp
//
//  Created by Afsal's Macbook Pro on 12/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit
import MapKit

@IBDesignable class DetailsFoodView: BaseView {
    
    
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var pageControl: UIPageControl?
    
    @IBOutlet weak var hoursLabel: UILabel?
    @IBOutlet weak var priceLabel: UILabel?
    @IBOutlet weak var locationLabel: UILabel?
    @IBOutlet weak var ratingsLabel: UILabel?
    @IBOutlet weak var mapView: MKMapView?
    
    @IBAction func handleControl(_ sender: UIPageControl) {
        
    }
}
