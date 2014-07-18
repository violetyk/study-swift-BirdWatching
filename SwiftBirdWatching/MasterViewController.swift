//
//  MasterViewController.swift
//  SwiftBirdWatching
//
//  Created by 加賀谷 祐平 on 2014/07/04.
//  Copyright (c) 2014年 nanapi Inc. All rights reserved.
//

import UIKit

//@objc(MasterViewController) class MasterViewController: UITableViewController {
class MasterViewController: UITableViewController {

    var dataController : BirdSightingDataController = BirdSightingDataController()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // #pragma mark - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if (segue.identifier?.isEqual("ShowSightingDetails")) {
//        if segue.identifier == "ShowSightingDetails" {

            var indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow()
            
            var detailViewController:DetailViewController = segue.destinationViewController as DetailViewController
            detailViewController.sighting = self.dataController.atIndex(indexPath.row)
        }
    }
    
    
    @IBAction func done(segue: UIStoryboardSegue) {
        if (segue.identifier?.isEqual("Done")) {
            var addController:AddSightingViewController = segue.sourceViewController as AddSightingViewController
            if (addController.birdSighting != nil) {
                self.dataController.add(addController.birdSighting!)
                self.tableView.reloadData()
            }
            self.dismissViewControllerAnimated(true, completion: {})
        }
    }
    
    @IBAction func cancel(segue: UIStoryboardSegue) {
        if (segue.identifier?.isEqual("Cancel")) {
            self.dismissViewControllerAnimated(true, completion:{})
        }
    }
    
    // #pragma mark - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataController.count()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BirdSightingCell", forIndexPath: indexPath) as UITableViewCell

        let birdSighting = self.dataController.atIndex(indexPath.row)
        
        let name = birdSighting!.name
        let location = birdSighting!.location
        cell.textLabel.text = NSString(format: "%@で%@を見た", location, name) as String
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        cell.detailTextLabel.text = formatter.stringFromDate(birdSighting?.date)
        
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.dataController.remove(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

