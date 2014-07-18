//
//  BirdSightingDataController.swift
//  SwiftBirdWatching
//
//  Created by 加賀谷 祐平 on 2014/07/07.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

import Foundation


class BirdSightingDataController : NSObject {

    var list : Array<BirdSighting> = Array<BirdSighting>()
    
    init() {
        super.init()
        self.initializeList()
    }
    
    func initializeList() -> Void {
        // とりあえず１つ入れてみる
        var birdSighting = BirdSighting(name: "鳩", location: "渋谷")
        self.add(birdSighting)
    }
    
    func add(birdSighting: BirdSighting) -> Void {
        self.list += birdSighting
//        self.list.append(birdSighting)
    }
    
    func remove(index:Int) -> Void {
        self.list.removeAtIndex(index)
    }
    
    func count() -> Int {
        return self.list.count
    }
    
    func atIndex(index:Int) -> BirdSighting? {
        return self.list[index]
    }
}