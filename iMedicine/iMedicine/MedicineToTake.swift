//
//  MedicineToTake.swift
//  iMedicine
//
//  Created by Felipe Affonso on 4/20/16.
//  Copyright © 2016 Natan Portilho. All rights reserved.
//

import Foundation

struct MedicineToTake{

    var name: String
    var time: NSDate
    var UUID: String
    
    init(name: String, time: NSDate, UUID: String){
        self.name = name
        self.time = time
        self.UUID = UUID
    }
    
    
    
}