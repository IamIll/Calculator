//
//  ViewController.swift
//  TestCalculator
//
//  Created by Илья Дунайцев on 13.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    var rigthValue: Int? = nil
    var leftValue: Int? = nil
    var needClearText = true
    var sign: ArithmeticSigns?
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
        func update(left: Int?, rigth: Int?) -> ArithmeticSigns {
            switch self {
            case .multiply:
                return .multiply(left, rigth)
            case .minus:
                return .minus(left, rigth)
            case .plus:
                return .plus(left, rigth)
            }
        }
    }
    func valueСalculation () {
        sign = sign?.update(left: leftValue, rigth: rigthValue)
        needClearText = false
        if sign?.computation != nil {
            guard let sgn = sign?.computation() else {return}
            leftValue = sgn
            rigthValue = nil
            numberTextField.text = String(sgn)
        }
    }
    @IBOutlet weak var labelSing: UILabel!
    @IBAction func digitsNumber(_ sender: UIButton) {
        if needClearText == false {
            numberTextField.text! = ""
            needClearText = true
        }
        if sign == nil {
            numberTextField.text! += String(sender.tag)
            leftValue = Int(numberTextField.text!)!
        } else {
            numberTextField.text! += String(sender.tag)
            rigthValue = Int(numberTextField.text!)!
        }
    }
    @IBAction func multiplication(_ sender: UIButton) {
        valueСalculation()
        sign = .multiply(leftValue, rigthValue)
        labelSing.text = sender.titleLabel?.text
//        labelSing.text! = String(sen)
    }
    @IBAction func subtraction(_ sender: UIButton) {
        valueСalculation()
        sign = .minus(leftValue, rigthValue)
        labelSing.text = sender.titleLabel?.text
    }
    @IBAction func addition(_ sender: UIButton) {
        valueСalculation()
        sign = .plus(leftValue, rigthValue)
        labelSing.text = sender.titleLabel?.text
    }
    @IBAction func equals(_ sender: UIButton) {
        valueСalculation()
        sign = nil
        labelSing.text = sender.titleLabel?.text
    }
    @IBAction func clear(_ sender: UIButton) {
        rigthValue = nil
        leftValue = nil
        sign = nil
        numberTextField.text = ""
        needClearText = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

