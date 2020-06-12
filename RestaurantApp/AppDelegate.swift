//
//  AppDelegate.swift
//  RestaurantApp
//
//  Created by Afsal's Macbook Pro on 12/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let locationService = LocationService()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        window = UIWindow()
        
        
        switch locationService.status {
        case .notDetermined, .denied, .restricted:
            
            
            let locationVC = storyboard.instantiateViewController(withIdentifier: "LocationViewController") as? LocationViewController
            locationVC?.locationService = locationService
            window?.rootViewController = locationVC
            
            
        default:
            let locationVC = storyboard.instantiateViewController(withIdentifier: "LocationViewController") as? LocationViewController
            locationVC?.locationService = locationService
            window?.rootViewController = locationVC
        }
        window?.makeKeyAndVisible()
        
        return true
    }


}

