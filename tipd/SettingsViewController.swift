//
//  SettingsViewController.swift
//  tipd
//
//  Created by Stacey Irawan on 9/13/16.
//  Copyright © 2016 Stacey Irawan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
let prefs = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var TipThree: UITextField!
    @IBOutlet weak var TipTwo: UITextField!
    @IBOutlet weak var TipOne: UITextField!
    
    @IBAction func Tip1(sender: AnyObject) {
        prefs.setDouble(Double(TipOne.text!)!, forKey: "percentOne")
    }
   
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func Tip2(sender: AnyObject) {
        prefs.setDouble(Double(TipTwo.text!)!, forKey: "percentTwo")
    }
    
    @IBAction func Tip3(sender: AnyObject) {
        prefs.setDouble(Double(TipThree.text!)!, forKey: "percentThree")
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
