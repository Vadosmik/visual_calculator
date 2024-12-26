//
//  ViewController.swift
//  visual_calculator
//
//  Created by Vadzim Mikanovich on 26/12/2024.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = true;
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            label.text = String(sender.tag)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else {
            label.text = label.text! + String(sender.tag)
            numberOnScreen = Double(label.text ?? "0") ?? 0
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16{
            previousNumber = Double(label.text ?? "0") ?? 0
            if sender.tag == 12 { //Divide
                label.text = "/";
            }
            if sender.tag == 13 { //Multiply
                label.text = "x";
            }
            if sender.tag == 14 { //Subtract
                label.text = "-";
            }
            if sender.tag == 15 { //Add
                label.text = "+";
            }
            operation = sender.tag
            performingMath = true;
        }
        else if sender.tag == 16 {
            if operation == 12{ //Divide
                label.text = String(previousNumber /
                                    numberOnScreen)
            }
            else if operation == 13{ //Multiply
                label.text = String(previousNumber *
                                    numberOnScreen)
            }
            else if operation == 14{ //Subtract
                label.text = String(previousNumber -
                                    numberOnScreen)
            }
            else if operation == 15{ //Add
                label.text = String(previousNumber +
                                    numberOnScreen)
            }
        }
        else if sender.tag == 11{
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "0"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be
        
    }
}

