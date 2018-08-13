//
//  TipCalcBrains.swift
//  TipsyTipCalculator
//
//  Created by Serényi  Zsófia on 2018. 07. 31..
//  Copyright © 2018. Serényi  Zsófia. All rights reserved.
//

import Foundation


class TipCalcBrains {
    private var _billAmount: Double = 0
    private var _tipPercent: Double = 0
    private var _tipAmount: Double = 0
    private var _totalAmount: Double = 0
    private var _splitNumber: Int = 0
    private var _splitAmount: Double = 0
    
    var billAmount: Double {
        get {
            return _billAmount
        } set {
            _billAmount = newValue
        }
    }
    
    var tipPercent: Double {
        get {
            return _tipPercent
        } set {
            _tipPercent = newValue
        }
    }
    
    var splitNumber: Int {
        get {
            return _splitNumber
        } set {
            _splitNumber = newValue
        }
    }
    
    var tipAmount: Double {
        return _tipAmount
    }
    
    var totalAmount: Double {
        return _billAmount + _tipAmount / 100
    }
    
    var splitAmount: Double {
        return _splitAmount
    }
    
    
    init(billAmount: Double, tipPercent: Double, splitNumber: Double) {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
        self._splitAmount = splitAmount
    }
    
    
    func calculateTip() {
        _tipAmount = billAmount * tipPercent
        _totalAmount = tipAmount + billAmount
    }
}
