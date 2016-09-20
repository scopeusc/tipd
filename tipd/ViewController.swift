//
//  ViewController.swift
//  tipd
//
//  Created by Stacey Irawan on 9/13/16.
//  Copyright © 2016 Stacey Irawan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let prefs = NSUserDefaults.standardUserDefaults()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        prefs.setDouble(0.15, forKey: "percentOne")
        prefs.setDouble(0.20, forKey: "percentTwo")
        prefs.setDouble(0.25, forKey: "percentThree")
        tipControl.setTitle(String(NSUserDefaults.standardUserDefaults().doubleForKey("percentOne") * 100) + " %", forSegmentAtIndex: 0)
        tipControl.setTitle(String(NSUserDefaults.standardUserDefaults().doubleForKey("percentTwo") * 100) + " %", forSegmentAtIndex: 1)
        tipControl.setTitle(String(NSUserDefaults.standardUserDefaults().doubleForKey("percentThree") * 100) + " %", forSegmentAtIndex: 2)
        
        // Do any additional setup after loading the view, typically from a nib.
        
        prefs.synchronize()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        prefs.synchronize()
        tipControl.setTitle(String(NSUserDefaults.standardUserDefaults().doubleForKey("percentOne") * 100) + " %", forSegmentAtIndex: 0)
        tipControl.setTitle(String(NSUserDefaults.standardUserDefaults().doubleForKey("percentTwo") * 100) + " %", forSegmentAtIndex: 1)
        tipControl.setTitle(String(NSUserDefaults.standardUserDefaults().doubleForKey("percentThree") * 100) + " %", forSegmentAtIndex: 2)
        super.viewDidAppear(true)
    }

    @IBOutlet weak var numPeople: UILabel!
    
    
    @IBAction func decrement(sender: UIButton) {
        let val = Int(self.numPeople.text!)
        if (val > 1){
            self.numPeople.text = String(val! - 1)
        }
       
    }

    @IBAction func increment(sender: UIButton) {
        let val = Int(self.numPeople.text!)
        if (val >= 1){
            self.numPeople.text = String(val! + 1)
        }
       
    }
    
    
    @IBOutlet weak var perPerson: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var totalLabel: UILabel!
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }

    @IBAction func calculateTip(sender: AnyObject) {
        
        let tipPercentages = [NSUserDefaults.standardUserDefaults().doubleForKey("percentOne"),
            NSUserDefaults.standardUserDefaults().doubleForKey("percentTwo"),
            NSUserDefaults.standardUserDefaults().doubleForKey("percentThree")]
        
        
        let bill = Double(billField.text!) ?? 0
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let perPersonBill = total / Double(numPeople.text!)!
        
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
        perPerson.text = String(format: "$%.2f", perPersonBill)
}
}
