//
//  ViewController.swift
//  TipsyTipCalculator
//
//  Created by Serényi  Zsófia on 2018. 07. 31..
//  Copyright © 2018. Serényi  Zsófia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    
    
    @IBOutlet weak var enterBillTF: UITextField!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitAmountLabel: UILabel!
    
    var tipCalcBrains = TipCalcBrains(billAmount: 25.00, tipPercent: 0.15, splitNumber: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func billAmountChange(_ sender: Any) {
        calculateTip()
        self.hideKeyboard()
    }
    
    @IBAction func tipPercengChange(_ sender: Any) {
        tipPercentValue()
        calculateTip()
        self.dismissKeyboard()
    }
    
    
    @IBAction func splitChange(_ sender: Any) {
        splitNumberValue()
        calculateSplitAmount()
    }
    
    
    func calculateTip() {
        tipCalcBrains.tipPercent = Double(tipPercentSlider.value * 100).rounded(toPlaces: 0)
        tipCalcBrains.billAmount = ((enterBillTF.text)! as NSString).doubleValue
        tipCalcBrains.calculateTip()
        updateBillUI()
    }
    
    func updateBillUI() {
        totalAmountLabel.text = String(format: "$%0.2f", tipCalcBrains.tipAmount / 100 + tipCalcBrains.billAmount)
        tipAmountLabel.text = String(format: "$%0.2f", tipCalcBrains.tipAmount / 100)
    }
    
    
    func tipPercentValue() {
        tipPercentLabel.text = "Tip: \(Int(tipCalcBrains.tipPercent))%"
    }
    
    func calculateSplitAmount() {
        tipCalcBrains.splitNumber = Int(splitSlider.value)
        updateBillUI2()
    }
    
    func updateBillUI2() {
        let splitAmount = tipCalcBrains.totalAmount / Double(tipCalcBrains.splitNumber)
        splitAmountLabel.text = String(format: "$%0.2f", splitAmount)
    }
    
    func splitNumberValue() {
        splitLabel.text = "Split: \(Int(splitSlider.value))"
    }
    
}



extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

