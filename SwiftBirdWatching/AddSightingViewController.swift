//
//  AddSightingViewController.swift
//  SwiftBirdWatching
//
//  Created by 加賀谷 祐平 on 2014/07/11.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

import Foundation
import UIKit

//class AddSightingViewController : UITableViewController {
class AddSightingViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet var birdNameInput: UITextField
    @IBOutlet var locationInput: UITextField
    
    var birdSighting: BirdSighting?
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        if (textField == self.birdNameInput || textField == self.locationInput) {
            textField.resignFirstResponder();
        }
        return true;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier?.isEqual("Done")) {
            let birdName:String = self.birdNameInput.text
            let location:String = self.locationInput.text
            if (countElements(birdName) > 0 && countElements(location) > 0) {
                self.birdSighting = BirdSighting(name:birdName, location:location)
            }
        }
    }
    
}