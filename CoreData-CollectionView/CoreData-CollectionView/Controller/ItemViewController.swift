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
    var selectedImage: UIImage?
    
    
    var name: String = ""
    var type: String = ""
    var value: Int = 0
    var quantity: Int = 0
    var itemDescription: String = ""
    var image: UIImage? = nil
    
    
    
    var cellIdentifier = "goToIcon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
        typeTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
        valueTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
        quantityTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
        descriptionTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        selectIconButton.setImage(selectedImage, for: .normal)
    }
    
    

    @IBAction func selectIconAction(_ sender: UIButton) {

    }
    
    @IBAction func unwindToItemVC(segue: UIStoryboardSegue) {}
    
    
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

        if let data = image?.pngData() {
            item.setValue(data, forKey: "image")
        }
        
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")


        do {
            try? managedContext.save()
        } catch {
            print("Could not save")
        }

        
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        guard let valueString = valueTextField.text else { return }
        guard let quantityString = quantityTextField.text else { return }
        
        switch sender {
        case nameTextField:
            name = nameTextField.text ?? ""
        case typeTextField:
            type = typeTextField.text ?? ""
        case valueTextField:
            value = Int(valueString) ?? 0
        case quantityTextField:
            quantity = Int(quantityString) ?? 0
        case descriptionTextField:
            itemDescription = descriptionTextField.text ?? ""
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
