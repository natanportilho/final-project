//
//  MedicineTableViewController.swift
//  iMedicine
//
//  Created by Felipe Affonso on 4/19/16.
//  Copyright © 2016 Natan Portilho. All rights reserved.
//

import UIKit

class MedicineTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var medicines = [Medicine]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem()
        
        // Load any saved medicines, otherwise load sample data.
        if let savedMedicines = loadMedicines() {
            medicines += savedMedicines
        } else {
            //Load sample data
            LoadSampleMedicines()
        }
    }
    
    func LoadSampleMedicines(){
        let medicine1 = Medicine(name: "Diclofenac", type: "Pain", interval: 8.0, firstTime: NSDate(), qtdOfPills: 8)!
        let medicine2 = Medicine(name: "aspirin", type: "Pain", interval: 1.0, firstTime: NSDate(), qtdOfPills: 10)!
        let medicine3 = Medicine(name: "Allegra", type: "Allergie", interval: 6.0, firstTime: NSDate(), qtdOfPills: 12)!
        
        medicines += [medicine1, medicine2, medicine3]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return medicines.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        
        let cellIdentifier = "MedicineTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MedicineTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let medicine = medicines[indexPath.row]
        
        cell.nameLabel.text = medicine.name
        cell.intervalLabel.text = String(medicine.interval)
        
        return cell
    }
    
    
    @IBAction func unwindToMedicineList(sender: UIStoryboardSegue){
        
        if let sourceViewController = sender.sourceViewController as? MedicineViewController, medicine = sourceViewController.medicine {
            
            //update an existing medicine
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                medicines[selectedIndexPath.row] = medicine
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            } else {
                //add a new medicine
                let newIndexPath = NSIndexPath(forRow: medicines.count, inSection: 0)
                medicines.append(medicine)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            //Save Medicines
            saveMedicines()
        }
        
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            medicines.removeAtIndex(indexPath.row)
            saveMedicines()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowDetail" {
            let medicineDetailViewController = segue.destinationViewController as! MedicineViewController
            
            if let selectedMedicineCell = sender as? MedicineTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedMedicineCell)!
                let selectedMedicine = medicines[indexPath.row]
                medicineDetailViewController.medicine = selectedMedicine
            }
        }
        else if segue.identifier == "AddItem" {
            
            print("Adding new medicine.")
        }
        
    }
    
    
    //MARK: NSCoding
    
    func saveMedicines(){
        
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(medicines, toFile: Medicine.ArchiveURL.path!)
        
        if !isSuccessfulSave {
            print("Failed to save medicines...")
        }
        
    }
    
    
    func loadMedicines() -> [Medicine]? {
        
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Medicine.ArchiveURL.path!) as? [Medicine]
    }
    
    
    
    
}
