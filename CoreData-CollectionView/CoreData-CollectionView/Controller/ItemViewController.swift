//
//  ItemViewController.swift
//  CoreData-CollectionView
//
//  Created by Ronald Maciel on 07/06/19.
//  Copyright © 2019 Ronald Maciel. All rights reserved.
//

import CoreData
import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var selectIconButton: UIButton!
    
    
    var name: String = ""
    var type: String = ""
    var value: Int16 = 0
    var quantity: Int16 = 0
    var itemDescription: String = ""
    var image: UIImage = #imageLiteral(resourceName: "Usable Item")
    
    
    
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
        save()
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    
    func save() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Item", in: managedContext)!
        
        let item = NSManagedObject(entity: entity, insertInto: managedContext)
        
        item.setValue(name, forKey: "name")
        item.setValue(type, forKey: "type")
        item.setValue(value, forKey: "value")
        item.setValue(quantity, forKey: "quantity")
        item.setValue(itemDescription, forKey: "itemDescription")
//        item.setValue(image, forKey: "image")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }



        
        
        
    }
}

extension ItemViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case nameTextField:
            name = nameTextField.text ?? ""
        case typeTextField:
            type = typeTextField.text ?? ""
//        case valueTextField:
//            value = valueTextField.text
//        case quantityTextField:
//            quantity = Int(quantityTextField.text)
        case descriptionTextField:
            itemDescription = descriptionTextField.text ?? ""
        default:
            return
        }
    }


}
