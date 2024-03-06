//
//  ViewController.swift
//  Calculator
//
//  Created by Deseret Baker on 3/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var currentNumber: Double = 0
    var firstOperand: Double?
    var operation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        guard let digit = sender.titleLabel?.text, let digitValue = Double(digit) else { return }
        currentNumber = currentNumber * 10 + digitValue
        updateDisplay()
    }
    
    @IBAction func decimalButtonPressed(_ sender: UIButton) {
        guard !displayLabel.text!.contains(".") else { return }
        displayLabel.text! += "."
    }
    
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        currentNumber *= -1
        updateDisplay()
    }
    
    @IBAction func percentButtonPressed(_ sender: UIButton) {
        currentNumber /= 100
        updateDisplay()
    }
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        guard let op = sender.titleLabel?.text else { return }
        
        if firstOperand == nil {
            firstOperand = currentNumber
        } else if let op = operation {
            performOperation(operation: op)
        }
        
        operation = op
        currentNumber = 0
    }
    
    @IBAction func equalsButtonPressed(_ sender: UIButton) {
        if let op = operation {
            performOperation(operation: op)
            operation = nil
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        currentNumber = 0
        firstOperand = nil
        operation = nil
        updateDisplay()
    }
    
    func performOperation(operation: String) {
        guard let first = firstOperand else { return }
        
        switch operation {
        case "+":
            currentNumber = first + currentNumber
        case "-":
            currentNumber = first - currentNumber
        case "×":
            currentNumber = first * currentNumber
        case "÷":
            if currentNumber != 0 {
                currentNumber = first / currentNumber
            }
        default:
            break
        }
        updateDisplay()
    }
    
    func updateDisplay() {
        displayLabel.text = String(currentNumber)
    }
    
}
