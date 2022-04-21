//
//  ViewController.swift
//  TestCalculator
//
//  Created by Илья Дунайцев on 13.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    var rigthValue: Int = 0
    var leftValue: Int = 0
    var markRecognition = ""
    var Switch = true
    var needClearText = true
    var signs: ArithmeticSigns?
    enum ArithmeticSigns {
        case multiply (Int?,Int?)
        case minus(Int?,Int?)
        case plus(Int?,Int?)
        
        func computation () -> Int? {
            
            switch self {
            case .multiply(let left, let rigth):
                guard let rhs = rigth, let lhs = left else {return nil}
                    return rhs * lhs
            case .minus(let left, let rigth):
                guard let rhs = rigth, let lhs = left else {return nil}
                    return lhs - rhs
            case .plus(let left, let rigth):
                guard let rhs = rigth, let lhs = left else {return nil}
                    return rhs + lhs
            }
        }
    }
    @IBAction func digitsNumber(_ sender: UIButton) {
        if needClearText == false {
            numberTextField.text! = ""
            needClearText = true
        }
        if Switch {
            numberTextField.text! += String(sender.tag)
            leftValue = Int(numberTextField.text!)!
        } else {
            numberTextField.text! += String(sender.tag)
            rigthValue = Int(numberTextField.text!)!
        }
    }
    @IBAction func multiplication(_ sender: UIButton) {
        if Switch {
            Switch = false
            needClearText = false
        } else {
            signs = .multiply(leftValue, rigthValue)
            guard let sgn = signs?.computation() else {return}
            leftValue = sgn
            needClearText = false
            rigthValue = 0
             return numberTextField.text = String(sgn)
        }
        markRecognition = "multiply"
    }
    @IBAction func subtraction(_ sender: UIButton) {
        if Switch {
            Switch = false
            needClearText = false
        } else {
            signs = .minus(leftValue, rigthValue)
            guard let sgn = signs?.computation() else {return}
            leftValue = sgn
            needClearText = false
            rigthValue = 0
             return numberTextField.text = String(sgn)
        }
        markRecognition = "minus"
    }
    @IBAction func addition(_ sender: UIButton) {
        if Switch {
            Switch = false
            needClearText = false
        } else {
            signs = .plus(leftValue, rigthValue)
            guard let sgn = signs?.computation() else {return}
            leftValue = sgn
            needClearText = false
            rigthValue = 0
             return numberTextField.text = String(sgn)
        }
        markRecognition = "plus"
    }
    @IBAction func equals(_ sender: UIButton) {
        Switch = true
        if markRecognition == "multiply" {
            signs = .multiply(leftValue, rigthValue)
            guard let sgn = signs?.computation() else {return}
            leftValue = sgn
            rigthValue = 0
            needClearText = false
            return numberTextField.text = String(sgn)
        } else if markRecognition == "minus"{
            signs = .minus(leftValue, rigthValue)
            guard let sgn = signs?.computation() else {return}
            leftValue = sgn
            rigthValue = 0
            needClearText = false
            return numberTextField.text = String(sgn)
        } else if markRecognition == "plus"{
            signs = .plus(leftValue, rigthValue)
            guard let sgn = signs?.computation() else {return}
            leftValue = sgn
            rigthValue = 0
            needClearText = false
            return numberTextField.text = String(sgn)
        }
    }
    @IBAction func clear(_ sender: UIButton) {
        rigthValue = 0
        leftValue = 0
        numberTextField.text = ""
        Switch = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

