//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var tipInputField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    
    var people = 2
    var tipSplit = Float(0.0)
    var tipBrain = TipBrain()
    var total = Float(0.0)
    var pct = Float(0.0)
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        pct = getPct(sender.currentTitle!)
        tipInputField.endEditing(true)
        if tipInputField.text == "" {
            total = 0.0
        } else {
            total = Float(tipInputField.text!)!
        }
        let split = calculateSplit(total)
        tipSplit = split
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        people = Int(sender.value)
        splitLabel.text = "\(people)"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print("Tip is split between \(people) people")
        print("Tip is: \(tipSplit)")
        self.performSegue(withIdentifier: "calcuateTip", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calcuateTip" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tipSplit = String(format: "%.2f", tipSplit)
            destinationVC.tipSettings = "Split between \(people) people, with \(pct*100)% tip"
        }
    }
    
    func getPct(_ pctTitle: String) -> Float {
        switch pctTitle {
        case "0%":
            return 0.0
        case "10%":
            return 0.10
        case "20%":
            return 0.20
        default:
            return 0.0
        }
    }
    
    func calculateSplit(_ total: Float) -> Float {
        let split = (total + total*pct)/Float(people)
        return split
    }
    
}

