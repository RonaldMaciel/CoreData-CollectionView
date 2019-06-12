//
//  IconViewController.swift
//  CoreData-CollectionView
//
//  Created by Ronald Maciel on 07/06/19.
//  Copyright © 2019 Ronald Maciel. All rights reserved.
//

import UIKit

class IconViewController: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func confirmChangesAction(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindSegueToItemVC", sender: nil)
    }
    
    
    @IBAction func selectIcon(_ sender: UIButton) {
        iconImageView.image = sender.currentImage
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "unwindSegueToItemVC") {
            let viewController = segue.destination as? ItemViewController
            viewController?.selectedImage = iconImageView.image
            
        } else {
            fatalError()
        }
    }
}

