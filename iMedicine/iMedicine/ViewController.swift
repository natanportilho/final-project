//
//// OnClick opens new viewController
//@IBAction func onClick(sender: AnyObject) {
//    
//    self.performSegueWithIdentifier("addMedicine", sender: self)
//    
//}

import UIKit
//var med = Medicine()
var namesArray = ["Felipe"]
class ViewController: UIViewController, UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return namesArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel!.text = namesArray[indexPath.row]
        let infoimage = UIImage(named: "info.png") as UIImage?
        
        var button = UIButton(type: UIButtonType.System) as UIButton
        button.frame = CGRectMake(350, 0, 50, 50)
        button.tag = indexPath.item
        button.setImage(infoimage, forState: .Normal)
        //button.backgroundColor = UIColor.blackColor()
        button.setTitle("\(indexPath.item)", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        cell.addSubview(button)
        return cell
    }
    
    func buttonClicked(sender: UIButton!){
        
        print("ok")
    }
    
    
    
}