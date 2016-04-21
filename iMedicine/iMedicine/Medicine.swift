//
//  Medicine.swift
//  iMedicine
//
//  Created by Felipe Affonso on 4/19/16.
//  Copyright © 2016 Natan Portilho. All rights reserved.
//

import Foundation


class Medicine: NSObject, NSCoding{
    
    var name: String
    var type: String
    var interval: Double
    var firstTime: NSDate
    var qtdOfPills: Int
    
    init?(name: String, type: String, interval: Double, firstTime: NSDate, qtdOfPills: Int) {
        self.name = name
        self.type = type
        self.interval = interval
        self.firstTime = firstTime
        self.qtdOfPills = qtdOfPills
        
        super.init()
        
        if name.isEmpty || interval == 0 {
            return nil
        }
        
    }
    
    
    //MARK: Types
    
    
    struct PropertyKey {
        static let nameKey = "name"
        static let typeKey = "type"
        static let intervalKey = "interval"
        static let firstTimeKey = "firsttime"
        static let qtdOfPillsKey = "qtdOfPills"
    }
    
    
    //MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(type, forKey: PropertyKey.typeKey)
        aCoder.encodeDouble(interval, forKey: PropertyKey.intervalKey)
        aCoder.encodeObject(firstTime, forKey: PropertyKey.firstTimeKey)
        aCoder.encodeInteger(qtdOfPills, forKey: PropertyKey.qtdOfPillsKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let type = aDecoder.decodeObjectForKey(PropertyKey.typeKey) as! String
        let interval = aDecoder.decodeDoubleForKey(PropertyKey.intervalKey)
        let firstTime = aDecoder.decodeObjectForKey(PropertyKey.firstTimeKey) as! NSDate
        let qtdOfPills = aDecoder.decodeIntegerForKey(PropertyKey.qtdOfPillsKey)
        // must call designed initializar
        self.init(name: name, type: type, interval: interval, firstTime: firstTime, qtdOfPills: qtdOfPills)
    }
    
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("medicines")
    
    
}