//
//  ItemViewController.swift
//  CoreData-CollectionView
//
//  Created by Ronald Maciel on 07/06/19.
//  Copyright © 2019 Ronald Maciel. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var selectIconButton: UIButton!
    
    var cellIdentifier = "goToIcon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))

//        guard let context = AppDelegate.persistentContainer?.viewContext else { return }


        view.addGestureRecognizer(tap)
    }
    
    
    
    

    @IBAction func selectIconAction(_ sender: UIButton) {

    }
    
    
    @IBAction func saveChangesAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}

//extension AppDelegate {
//    static var persistentContainer: NSPersistentContainer? {
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
//        return appDelegate.persistentContainer
//    }
//}
