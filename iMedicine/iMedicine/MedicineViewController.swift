

import UIKit

class MedicineViewController: UIViewController, UITextFieldDelegate, /*UIImagePickerControllerDelegate, */UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var intervalTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
   
    @IBOutlet weak var firstTimeDatePicker: UIDatePicker!
    
    @IBOutlet weak var qtdOfPillsTextField: UITextField!
    var medicine: Medicine?
    
    // MARK: UIImagePickerControllerDelegate
    
//    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
//        // Dismiss the picker if the user canceled.
//        dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        
//        // The info dictionary contains multiple representations of the image, and this uses the original.
//        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
//        
//        // Set photoImageView to display the selected image.
//        photoImageView.image = selectedImage
//        
//        // Dismiss the picker.
//        dismissViewControllerAnimated(true, completion: nil)
//        
//    }
    
    
    //MARK - Actions
    
//    @IBAction func SelectImageFromLibrary(sender: UITapGestureRecognizer) {
//        intervalTextField.resignFirstResponder()
//        
//        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
//        let imagePickerController = UIImagePickerController()
//        
//        // Only allow photos to be picked, not taken.
//        imagePickerController.sourceType = .PhotoLibrary
//        
//        // Make sure ViewController is notified when the user picks an image.
//        imagePickerController.delegate = self
//        
//        presentViewController(imagePickerController, animated: true, completion: nil)
//        
//    }
    
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        let isPresentingInAddMedicineMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMedicineMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Disable the savebutton if the name is empty
        nameTextField.delegate = self
        
        // for medicine edit
        if let medicine = medicine {
            navigationItem.title = medicine.name
            nameTextField.text   = medicine.name
            intervalTextField.text = String(medicine.interval)
            typeTextField.text = medicine.type
            firstTimeDatePicker.date = medicine.firstTime
        }
        
        //check if it's a valid medicine
        checkValidMedicineName()
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidMedicineName()
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.enabled = false
    }
    
    func checkValidMedicineName() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if saveButton === sender {
            let name = nameTextField.text ?? ""
            let type = typeTextField.text ?? ""
            let interval = Double(intervalTextField.text!)
            let firstTime = firstTimeDatePicker.date
            let qtdOfPills = Int(qtdOfPillsTextField.text!)
            var i = 0
            medicine = Medicine(name: name, type: type, interval: interval!, firstTime: firstTime, qtdOfPills: qtdOfPills!)
            
            
            //  let intervalcalendar: NSCalendarUnit =
            
            var notification = UILocalNotification()
            notification.alertBody = "The the medicine: \(medicine!.name)"
            notification.alertAction = "open"
            notification.fireDate = medicine?.firstTime
            notification.soundName = UILocalNotificationDefaultSoundName
            //notification.userInfo = ["UUID": medicine?.name] SEARCH IF ITS NECESSARY
            notification.category = "MEDICINE_TO_TAKE"
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
           
            var last = medicine?.firstTime
            
            for (i=0;i<qtdOfPills;i+=1){
                
                let calendar = NSCalendar.currentCalendar()
                let components = NSDateComponents()
                components.minute = Int((medicine?.interval)!)
                let date = calendar.dateByAddingComponents(components, toDate: last!, options: [])
                var notification = UILocalNotification()
                notification.alertBody = "The the medicine: \(medicine!.name)"
                notification.alertAction = "open"
                
                
                notification.fireDate = date
                notification.soundName = UILocalNotificationDefaultSoundName
                //notification.userInfo = ["UUID": medicine?.name] SEARCH IF ITS NECESSARY
                notification.category = "MEDICINE_TO_TAKE"
                
                UIApplication.sharedApplication().scheduleLocalNotification(notification)
                
                
                last = date
            }
            
         
            
        }
        
        if segue.identifier == "sendName"{
            
            var webview  = segue.destinationViewController as! WebViewController
            
            webview.medicinename = nameTextField.text ?? ""
        }
    }
   
   
}