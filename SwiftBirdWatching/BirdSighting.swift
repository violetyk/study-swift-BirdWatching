//
//  BirdSighting.swift
//  SwiftBirdWatching
//
//  Created by 加賀谷 祐平 on 2014/07/04.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

import Foundation

class BirdSighting : NSObject {
    
    var name: String
    var location: String
    var date: NSDate
    
/*
    init(name:String, location:String, date:NSDate?) {
      
        self.name = name
        self.location = location

        if !date {
            let date = NSDate()
        }
        self.date = date!
    }
*/
    init(name:String, location:String, date:NSDate) {
        self.name = name
        self.location = location
        self.date = date
    }

    
    convenience init(name:String, location:String) {
        let date = NSDate()
        self.init(name:name, location:location, date:date)
    }
}