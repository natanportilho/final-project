//
//  addMedicineViewController.swift
//  iMedicine
//
//  Created by Natan Portilho on 4/18/16.
//  Copyright © 2016 Natan Portilho. All rights reserved.
//

//
//  ViewController.swift
//  iMedicine
//
//  Created by Natan Portilho on 4/18/16.
//  Copyright © 2016 Natan Portilho. All rights reserved.
//

import UIKit

class NewMedicineViewController:  UIViewController {
    
    @IBOutlet weak var intervalTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func saveButton(sender: AnyObject) {
        
        let name = nameTextField.text ?? ""
        let type = typeTextField.text ?? ""
        let interval = Double(intervalTextField.text!)
        
        let medicine = Medicine(name: name, type: type, interval: interval!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    
    
}


