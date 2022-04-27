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
    var sgn: Int? = nil
    var markRecognition = ""
    var switchDirection = true
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
    func copy1 () {
        sign = sign?.update(left: leftValue, rigth: rigthValue)
        needClearText = false
        if sign?.computation != nil {
            guard let sgn = sign?.computation() else {return}
            leftValue = sgn
            rigthValue = nil
            numberTextField.text = String(sgn)
        }
        
    }
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
        copy1()
        sign = .multiply(leftValue, rigthValue)
    }
    @IBAction func subtraction(_ sender: UIButton) {
        copy1()
        sign = .minus(leftValue, rigthValue)
    }
    @IBAction func addition(_ sender: UIButton) {
        copy1()
        sign = .plus(leftValue, rigthValue)
    }
    @IBAction func equals(_ sender: UIButton) {
        copy1()
        sign = nil
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

