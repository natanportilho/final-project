//
//  WebViewController.swift
//  iMedicine
//
//  Created by Felipe Affonso on 4/21/16.
//  Copyright © 2016 Natan Portilho. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
     var medicine: Medicine?
    var medicinename:String!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var name = "http://www.drugs.com/\(medicinename).html"
        
        print(name)
        
        let url = NSURL(string: name)!
        
        webView.loadRequest(NSURLRequest(URL: url))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
