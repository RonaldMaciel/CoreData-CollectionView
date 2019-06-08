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
//        if let itemViewController = presentingViewController as? ItemViewController {
//
//           itemViewController.selectIconButton.currentImage = iconImageView.image
//        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func selectIcon(_ sender: UIButton) {
        iconImageView.image = sender.currentImage
    }
    
}
