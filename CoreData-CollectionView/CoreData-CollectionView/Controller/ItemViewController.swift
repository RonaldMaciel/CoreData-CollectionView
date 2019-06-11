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
    var value: Int = 0
    var quantity: Int = 0
    var itemDescription: String = ""
    var image: UIImage = #imageLiteral(resourceName: "Usable Item")
    
    
    
    var cellIdentifier = "goToIcon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
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

    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToIcon" {
//            guard let destination = segue.destination as? IconViewController else { return }
//            let iconImage = destination.iconImageView.image
//
//            selectIconButton.setImage(iconImage, for: .normal)
//
//        }
//    }
    
    func save() {
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//
//        let managedContext = appDelegate.persistentContainer.viewContext
//
//        let entity = NSEntityDescription.entity(forEntityName: "Item", in: managedContext)!
//
//        let item = NSManagedObject(entity: entity, insertInto: managedContext)
//
//        item.setValue(name, forKey: "name")
//        item.setValue(type, forKey: "type")
//        item.setValue(value, forKey: "value")
//        item.setValue(quantity, forKey: "quantity")
//        item.setValue(itemDescription, forKey: "itemDescription")
//
//        if let data = image.pngData() {
//            item.setValue(data, forKey: "image")
//        }
//
//
//        do {
//            //try managedContext.save()
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
//


        printaImage()
        
    }
    
    func printaImage() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Item", in: managedContext)!
        
        //let item = NSManagedObject(entity: entity, insertInto: managedContext)
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        
        do {
            let result = try? managedContext.fetch(fetch)
            
            for data in result as! [NSManagedObject] {
                managedContext.delete(data)
                print(data)
            }
            
            try managedContext.save()
        } catch {
            fatalError()
        }
        
        
        
    }
    
    
    
}

extension ItemViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let valueString = valueTextField.text else { return }
        guard let quantityString = quantityTextField.text else { return }
        
        switch textField {
        case nameTextField:
            name = nameTextField.text ?? "gtgtg"
        case typeTextField:
            type = typeTextField.text ?? "gtgt"
        case valueTextField:
            value = Int(valueString) ?? 0
        case quantityTextField:
            quantity = Int(quantityString) ?? 0
        case descriptionTextField:
            itemDescription = descriptionTextField.text ?? "gtgt"
        default:
            return
        }
    }


}

extension ItemViewController {
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        self.performSegue(withIdentifier: cellIdentifier, sender: sender)
    }
}
