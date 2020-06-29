//
//  DetailsFoodViewController.swift
//  RestaurantApp
//
//  Created by Afsal's Macbook Pro on 12/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit

class DetailsFoodViewController: UIViewController {
    
    @IBOutlet weak var detailsFoodView: DetailsFoodView?
    let adapter = Adapter<DetailsViewModel, DetailsCollectionViewCell>()
    var viewModel: DetailsViewModel? {
        didSet {
            updateView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsFoodView?.collectionView?.register(cellType: DetailsCollectionViewCell.self)
    }
    
    func updateView() {
        if let viewModel = viewModel {
            detailsFoodView?.priceLabel?.text = viewModel.price
            detailsFoodView?.hoursLabel?.text = viewModel.isOpen
            detailsFoodView?.locationLabel?.text = viewModel.phoneNumber
            detailsFoodView?.ratingsLabel?.text = viewModel.rating

        }
    }
}

extension UICollectionView {
    func register<Cell: UICollectionViewCell>(cellType: Cell.Type) {
        register(cellType, forCellWithReuseIdentifier: String(describing: cellType))
    }
    
    func dequeue<Cell: UICollectionViewCell>(_ indexPath: IndexPath) -> Cell {
        return dequeueReusableCell(withReuseIdentifier: String(describing: Cell.self), for: indexPath) as! Cell
    }
}

extension UIView {
    var width: CGFloat {
        return self.frame.size.width
    }
    var height: CGFloat {
        return self.frame.size.height
    }
}

class Adapter<T, Cell: UICollectionViewCell>: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var items: [T] = []
    var configure: ((T, Cell) -> Void)?
    var select: ((T) -> Void)?
    var cellHeight: CGFloat = 50.0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: Cell = collectionView.dequeue(indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.width, height: cellHeight)
    }
}
