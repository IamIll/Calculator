//
//  ViewController.swift
//  TestCalculator
//
//  Created by Илья Дунайцев on 13.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    var initialValue: Int = 0
    var endValue: Int = 0
    var markRecognition = ""
    var clearText = 0
    enum ArithmeticSigns {
        case multiply (Int,Int)
        case minus(Int,Int)
        
        func computation () -> Int {
            
            switch self {
            case .multiply(let rigth, let left):
                    return rigth * left
            case .minus(let rigth, let left):
                    return left - rigth
            }
        }
    }
    
    @IBAction func digitsNumber(_ sender: UIButton) {
        if clearText == 0 {
            numberTextField.text! += String(sender.tag)
            initialValue = Int(numberTextField.text!)!
        } else {
            numberTextField.text = ""
            numberTextField.text! += String(sender.tag)
            initialValue = Int(numberTextField.text!)!
            clearText = 0
            return
        }
    }
    @IBAction func multiplication(_ sender: UIButton) {
        
        if clearText == 0 {
            endValue = initialValue
            numberTextField.text = ""
        } else {
        //numberTextField.text = String(computation(sings: .multiply(initialValue, endValue)))
        }
        markRecognition = "multiply"
    }
    @IBAction func subtraction(_ sender: UIButton) {
        
        if clearText == 0 {
            numberTextField.text = ""
            endValue += initialValue
        } else {
            let subtraction = ArithmeticSigns.minus(initialValue, endValue)
            numberTextField.text = String(subtraction.computation())
        }
        markRecognition = "minus"
    }
    @IBAction func addition(_ sender: UIButton) {
    }
    @IBAction func equals(_ sender: UIButton) {
        if markRecognition == "multiply" {
            let multiplication = ArithmeticSigns.multiply(initialValue, endValue)
            numberTextField.text = String(multiplication.computation())
            clearText = 1
        } else if markRecognition == "minus"{
            let subtraction = ArithmeticSigns.minus(initialValue, endValue)
            numberTextField.text = String(subtraction.computation())
            print(numberTextField.text)
            endValue = subtraction.computation()
            clearText = 1
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

