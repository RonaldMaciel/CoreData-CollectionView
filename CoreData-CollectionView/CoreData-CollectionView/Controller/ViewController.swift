//
//  ViewController.swift
//  CoreData-CollectionView
//
//  Created by Ronald Maciel on 07/06/19.
//  Copyright © 2019 Ronald Maciel. All rights reserved.
//

import CoreData
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [NSManagedObject] = []
    
    var cellIdentifier = "ItemCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToItem" {
            guard let destination = segue.destination as? ItemViewController else { return }
            // abc
        }
    }
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count + 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row >= items.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddItemCell", for: indexPath) as! AddItemCollectionViewCell
            cell.addItemImageView.image = #imageLiteral(resourceName: "Add Item")
            return cell
        } else {
            let item = items[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ItemCellCollectionViewCell
            cell.itemImageView.image = item.value(forKey: "image") as? UIImage
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToItem", sender: nil)
    }
    
}




