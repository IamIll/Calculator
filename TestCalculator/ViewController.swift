//
//  ViewController.swift
//  TestCalculator
//
//  Created by Илья Дунайцев on 13.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    var initialValue: Double = 0
    var endValue: Double = 0
    var markRecognition = ""
    enum ArithmeticSigns {
        case multiply (Double,Double)
        case minus(Double,Double)
        
        func computation (sings: ArithmeticSigns) -> Double {
            
            let initFirst = ArithmeticSigns.multiply(initialValue, endValue)
            switch initFirst {
            case .multiply(let rigth, let left):
                    return rigth * left
            case .minus(let rigth, let left):
                    return left - rigth
            }
        }
    }
    
    @IBAction func digitsNumber(_ sender: UIButton) {
//        if numberTextField.text != String(computation(sings: .multiply(initialValue, endValue))) {
            numberTextField.text! += String(sender.tag)
            initialValue = Double(numberTextField.text!)!
//        } else {
//            numberTextField.text = ""
//            numberTextField.text! += String(sender.tag)
//            return
//        }
    }
    @IBAction func multiplication(_ sender: UIButton) {
        if endValue == 0 {
            endValue = initialValue
            numberTextField.text = ""
        } else {
        numberTextField.text = String(computation(sings: .multiply(initialValue, endValue)))
        }
        markRecognition = "multiply"
    }
    @IBAction func subtraction(_ sender: UIButton) {
        if endValue == 0 {
            endValue = initialValue
            numberTextField.text = ""
        } else {
        numberTextField.text = String(computation(sings: .minus(initialValue, endValue)))
        }
        markRecognition = "minus"
    }
    @IBAction func addition(_ sender: UIButton) {
    }
    @IBAction func equals(_ sender: UIButton) {
        if markRecognition == "multiply" {
            numberTextField.text = String(computation(sings: .multiply(initialValue, endValue)))
        } else if markRecognition == "minus"{
                numberTextField.text = String(computation(sings: .minus(initialValue, endValue)))
            }
    }
    @IBAction func clear(_ sender: UIButton) {
        endValue = 0
        initialValue = 0
        numberTextField.text = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

