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
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var time: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(sender: AnyObject) {
        
    }
    
    
    
}


