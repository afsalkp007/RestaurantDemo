//
//  AppDelegate.swift
//  RestaurantApp
//
//  Created by Afsal's Macbook Pro on 12/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit
import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let locationService = LocationService()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let service = MoyaProvider<YelpService.BusinessProvider>()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        window = UIWindow()
        
        service.request(.search(lat: 42.361145, long: -71.057083 )) { (result) in
            
            switch result {
            case .success(let response):
                print(try? JSONSerialization.jsonObject(with: response.data, options: []))
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
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

