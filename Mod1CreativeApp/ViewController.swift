//
//  ViewController.swift
//  Mod1CreativeApp
//
//  Created by JAYDEN SAWYER on 8/28/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTextField.delegate = self
        secondTextField.delegate = self
            }
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        calculate(operation: .addition)
    }
    
    @IBAction func timesButtonAction(_ sender: UIButton) {
        calculate(operation: .multiplication)
    }
    
    @IBAction func minusButtonAction(_ sender: UIButton) {
        calculate(operation: .subtraction)
    }
    
    @IBAction func divideButtonAction(_ sender: UIButton) {
        calculate(operation: .division)
    }
    
    private func calculate(operation: Operation) {
        guard let firstText = firstTextField.text,
    let secondText = secondTextField.text,
    let firstNumber = Double(firstText),
    let secondNumber = Double(secondText) else {
            label.text = "try another input"
            return
        }
        
        var result: Double = 0.0
        
        switch operation {
        case.addition:
            result = firstNumber + secondNumber
        case.subtraction:
            result = firstNumber - secondNumber
        case.multiplication:
            result = firstNumber * secondNumber
        case.division:
            if secondNumber != 0 {
                result = firstNumber / secondNumber
            } else {
                label.text = "Cannot divide by zero"
                return
            }
        }
        
        label.text = "\(result)"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

enum Operation {
    case addition
    case subtraction
    case multiplication
    case division
}
