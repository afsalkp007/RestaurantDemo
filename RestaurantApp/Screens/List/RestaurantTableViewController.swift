//
//  RestaurantTableViewController.swift
//  RestaurantApp
//
//  Created by Afsal's Macbook Pro on 12/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit

protocol ListActions: class {
    func didTapCell(_ viewModel: RestaurantListViewModel)
}

class RestaurantTableViewController: UITableViewController {
    
    private let reuseId = "RestarantTableViewCell"
    weak var delegate: ListActions?
    var viewModels = [RestaurantListViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! RestarantTableViewCell
        
        let vm = viewModels[indexPath.row]
        cell.configure(with: vm)
        
        return cell
    }
    
    // MARK: - Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vm = viewModels[indexPath.row]
        delegate?.didTapCell(vm)
    }

}
