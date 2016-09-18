//
//  ViewController.swift
//  tipd
//
//  Created by Stacey Irawan on 9/13/16.
//  Copyright © 2016 Stacey Irawan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

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
        let tipPercentages = [0.15, 0.2, 0.25]
        
        
        let bill = Double(billField.text!) ?? 0
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
}
}
