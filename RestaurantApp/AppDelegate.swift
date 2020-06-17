//
//  AppDelegate.swift
//  RestaurantApp
//
//  Created by Afsal's Macbook Pro on 12/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit
import Moya
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let locationService = LocationService()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let service = MoyaProvider<YelpService.BusinessProvider>()
    let jsonDecoder = JSONDecoder()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        window = UIWindow()
        
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        locationService.didChangeStatus = { [weak self] success in
            if success {
                self?.locationService.getLocation()
            }
        }
        
        locationService.newLocation = { [weak self] result in
            switch result {
            case .success(let location):
                self?.loadBusiness(with: location.coordinate)
            case .failure(let error):
                assertionFailure("Error getting the user location \(error)")
            }
        }
        
        switch locationService.status {
        case .notDetermined, .denied, .restricted:
            
            
            let locationVC = storyboard.instantiateViewController(withIdentifier: "LocationViewController") as? LocationViewController
            locationVC?.delegate = self
            window?.rootViewController = locationVC
            
            
        default:
            let nav = storyboard.instantiateViewController(identifier: "RestaurantNavigationController") as? UINavigationController
            window?.rootViewController = nav
            locationService.getLocation()
        }
        window?.makeKeyAndVisible()
        
        return true
    }

    private func loadBusiness(with coordinate: CLLocationCoordinate2D) {
        service.request(.search(lat: 42.361145, long: -71.057083 )) { [weak self] (result) in
        //service.request(.search(lat: coordinate.latitude, long: coordinate.longitude )) { [weak self] (result) in
            
            guard let self = self else { return }
               switch result {
               case .success(let response):
                   
                   let root = try? self.jsonDecoder.decode(Root.self, from: response.data)
                   let viewModels = root?.businesses
                    .compactMap(RestaurantListViewModel.init)
                    .sorted(by: { $0.distance < $1.distance })
                
                   if let nav = self.window?.rootViewController as? UINavigationController, let restaurantListViewController = nav.topViewController as? RestaurantTableViewController {
                    restaurantListViewController.viewModels = viewModels ?? []
                }
                
               case .failure(let error):
                   print("Error: \(error)")
               }
           }
    }
}

extension AppDelegate: LocationActions {
    
    func didTapAllow() {
        locationService.requestLocationAuthorization()
    }
}
