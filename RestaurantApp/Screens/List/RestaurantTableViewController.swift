//
//  RestaurantTableViewController.swift
//  RestaurantApp
//
//  Created by Afsal's Macbook Pro on 12/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit

protocol ListActions: class {
    func didTapCell(_ viewController: UIViewController, viewModel: RestaurantListViewModel)
}

class RestaurantTableViewController: UITableViewController {
    
    let tableAdapter = TableAdapter<RestaurantListViewModel, RestarantTableViewCell>()
    
    weak var delegate: ListActions?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = tableAdapter
        tableView.dataSource = tableAdapter
        
        tableAdapter.configure = { viewModel, cell in
            let url = URL(string: viewModel.imageUrl)!
            cell.restaurantImageView.setImage(withURL: url)
            cell.restaurantNameLabel.text = viewModel.name
            cell.locationLabel.text = viewModel.formattedDistance
        }
        
        tableAdapter.select = { [weak self] viewModel in
            guard let detailsViewController = self?.storyboard?.instantiateViewController(identifier: "DetailsFoodViewController") else { return }
            self?.delegate?.didTapCell(detailsViewController, viewModel: viewModel)
        }
    }
    
    func handle(_ viewModels: [RestaurantListViewModel]?) {
        guard let viewModels = viewModels else { return }
        tableAdapter.items = viewModels
        tableView.reloadData()
    }

}

class TableAdapter<T, Cell: UITableViewCell>: NSObject, UITableViewDelegate, UITableViewDataSource {

    var items: [T] = []
    var configure: ((T, Cell) -> ())?
    var select: ((T) -> ())?
    var cellHeight: CGFloat = 236.0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Cell = tableView.dequeue(indexPath)
        let item = items[indexPath.row]
        configure?(item, cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        select?(item)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

extension UITableView {
    
    func dequeue<Cell: UITableViewCell>(_ indexPath: IndexPath) -> Cell {
        return dequeueReusableCell(withIdentifier: String(describing: Cell.self), for: indexPath) as! Cell
    }
    
    func register(cellType: UITableViewCell.Type) {
        register(cellType, forCellReuseIdentifier: String(describing: cellType))
    }
}
