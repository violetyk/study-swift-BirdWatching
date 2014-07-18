//
//  DetailViewController.swift
//  SwiftBirdWatching
//
//  Created by 加賀谷 祐平 on 2014/07/04.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

import UIKit

//class DetailViewController: UIViewController {
class DetailViewController: UITableViewController {

    var sighting : BirdSighting?
    
    /*
    var sighting : BirdSighting? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    */
    
    @IBOutlet var nameLabel : UILabel
    @IBOutlet var locationLabel : UILabel
    @IBOutlet var dateLabel : UILabel
    

    func configureView() {
        self.nameLabel.text = self.sighting?.name
        self.locationLabel.text = self.sighting?.location
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        self.dateLabel.text = formatter.stringFromDate(self.sighting?.date)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}