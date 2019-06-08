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
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ItemCellCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToItem", sender: nil)
    }
    
}




