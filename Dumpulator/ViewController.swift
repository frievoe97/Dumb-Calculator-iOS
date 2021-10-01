//
//  ViewController.swift
//  Hello iOS
//
//  Created by Friedrich Völkers on 29.09.21.
//

import UIKit

class ViewController: UIViewController {
    
    var resultString: String = ""
    var resultDouble: Double = 0.0
    var lastNumber: Double = 0.0
    var currentMode = ""
    let preResultNumber: Double? = nil
    var buttons = [0: "1", 1: "2", 2: "3", 3: "/", 4 : "4", 5 : "5", 6 : "6", 7 : "*", 8 : "7", 9 : "8", 10: "9", 11: "-", 12: "0", 13: ",", 14: "=", 15 : "+"]
    var buttonsValues = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "/", "*", "-", "+", "=", ","]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultDisplay.text? = resultString
    }

    // Elements
    @IBOutlet weak var resultDisplay: UITextView!
    
    @IBAction func pressButton00(_ sender: Any) {
        pressButton(id: 0)
    }
    @IBAction func pressButton01(_ sender: Any) {
        pressButton(id: 1)
    }
    @IBAction func pressButton02(_ sender: Any) {
        pressButton(id: 2)
    }
    @IBAction func pressButton03(_ sender: Any) {
        pressButton(id: 3)
    }
    @IBAction func pressButton04(_ sender: Any) {
        pressButton(id: 4)
    }
    @IBAction func pressButton05(_ sender: Any) {
        pressButton(id: 5)
    }
    @IBAction func pressButton06(_ sender: Any) {
        pressButton(id: 6)
    }
    @IBAction func pressButton07(_ sender: Any) {
        pressButton(id: 7)
    }
    @IBAction func pressButton08(_ sender: Any) {
        pressButton(id: 8)
    }
    @IBAction func pressButton09(_ sender: Any) {
        pressButton(id: 9)
    }
    @IBAction func pressButton10(_ sender: Any) {
        pressButton(id: 10)
    }
    @IBAction func pressButton11(_ sender: Any) {
        pressButton(id: 11)
    }
    @IBAction func pressButton12(_ sender: Any) {
        pressButton(id: 12)
    }
    @IBAction func pressButton13(_ sender: Any) {
        pressButton(id: 13)
    }
    @IBAction func pressButton14(_ sender: Any) {
        pressButton(id: 14)
    }
    @IBAction func pressButton15(_ sender: Any) {
        pressButton(id: 15)
    }
    
    @IBAction func clear(_ sender: Any) {
        buttons = [0: "1", 1: "2", 2: "3", 3: "/", 4 : "4", 5 : "5", 6 : "6", 7 : "*", 8 : "7", 9 : "8", 10: "9", 11: "-", 12: "0", 13: ",", 14: "=", 15 : "+"]
        button00.setTitle(buttons[0], for: .normal)
        button01.setTitle(buttons[1], for: .normal)
        button02.setTitle(buttons[2], for: .normal)
        button03.setTitle(buttons[3], for: .normal)
        button04.setTitle(buttons[4], for: .normal)
        button05.setTitle(buttons[5], for: .normal)
        button06.setTitle(buttons[6], for: .normal)
        button07.setTitle(buttons[7], for: .normal)
        button08.setTitle(buttons[8], for: .normal)
        button09.setTitle(buttons[9], for: .normal)
        button10.setTitle(buttons[10], for: .normal)
        button11.setTitle(buttons[11], for: .normal)
        button12.setTitle(buttons[12], for: .normal)
        button13.setTitle(buttons[13], for: .normal)
        button14.setTitle(buttons[14], for: .normal)
        button15.setTitle(buttons[15], for: .normal)
        resultString = ""
        lastNumber = 0.0
        currentMode = ""
        updateDisplay()
    }
    
    @IBOutlet weak var button00: UIButton!
    @IBOutlet weak var button01: UIButton!
    @IBOutlet weak var button02: UIButton!
    @IBOutlet weak var button03: UIButton!
    @IBOutlet weak var button04: UIButton!
    @IBOutlet weak var button05: UIButton!
    @IBOutlet weak var button06: UIButton!
    @IBOutlet weak var button07: UIButton!
    @IBOutlet weak var button08: UIButton!
    @IBOutlet weak var button09: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    
    // Functions
    func updateDisplay() {
        var output = resultString
        output = output.replacingOccurrences(of: ".", with: ",")
        resultDisplay.text? = output
    }
    
    func markButton() {
        // Step 1: unmark old Button
        // Step 2: mark new Button
    }
    
    func convertString() {
        if (Double(Int(resultDouble)) - resultDouble) == 0 {
            resultString = String(Int(resultDouble))
        } else {
            resultString = String(resultDouble)
        }
    }
    
    func switchButtons() {
        buttonsValues = buttonsValues.shuffled()
        for i in 0...15 {
            buttons[i] = buttonsValues[i]
        }
        button00.setTitle(buttons[0], for: .normal)
        button01.setTitle(buttons[1], for: .normal)
        button02.setTitle(buttons[2], for: .normal)
        button03.setTitle(buttons[3], for: .normal)
        button04.setTitle(buttons[4], for: .normal)
        button05.setTitle(buttons[5], for: .normal)
        button06.setTitle(buttons[6], for: .normal)
        button07.setTitle(buttons[7], for: .normal)
        button08.setTitle(buttons[8], for: .normal)
        button09.setTitle(buttons[9], for: .normal)
        button10.setTitle(buttons[10], for: .normal)
        button11.setTitle(buttons[11], for: .normal)
        button12.setTitle(buttons[12], for: .normal)
        button13.setTitle(buttons[13], for: .normal)
        button14.setTitle(buttons[14], for: .normal)
        button15.setTitle(buttons[15], for: .normal)
    }
    
    func calculate(opearation: String) {
        switch opearation {
        case "+" :
            resultDouble = lastNumber + resultDouble
            resultString = String(resultDouble)
            convertString()
            updateDisplay()
        case "-" :
            resultDouble = lastNumber - resultDouble
            resultString = String(resultDouble)
            convertString()
            updateDisplay()
        case "*" :
            resultDouble = lastNumber * resultDouble
            resultString = String(resultDouble)
            convertString()
            updateDisplay()
        case "/" :
            resultDouble = lastNumber / resultDouble
            resultString = String(resultDouble)
            convertString()
            updateDisplay()
        case "=" :
            updateDisplay()
        case ""  :
            updateDisplay()
        default :
            print("Fehler!!!")
            
        }
    }
    
    func pressButton(id: Int) {
        if (Int(buttons[id]!) != nil) {
            if currentMode == "=" {
                resultString = ""
                currentMode = ""
            }
            resultString += String(buttons[id]!)
            resultDouble = Double(resultString)!
            updateDisplay()
            
        } else if buttons[id] == "=" {
            calculate(opearation: currentMode)
            markButton()
            currentMode = "="
            lastNumber = 0.0
        } else if buttons[id] == "," {
            if !resultString.contains(".") {
                resultString += "."
                updateDisplay()
            }
            //switchButtons()
        } else if buttons[id] == "+" {
            calculate(opearation: currentMode)
            markButton()
            currentMode = "+"
            lastNumber = resultDouble
            resultString = ""
            switchButtons()
        } else if buttons[id] == "-" {
            calculate(opearation: currentMode)
            markButton()
            currentMode = "-"
            lastNumber = resultDouble
            resultString = ""
            switchButtons()
        } else if buttons[id] == "*" {
            calculate(opearation: currentMode)
            markButton()
            currentMode = "*"
            lastNumber = resultDouble
            resultString = ""
            switchButtons()
        } else if buttons[id] == "/" {
            calculate(opearation: currentMode)
            markButton()
            currentMode = "/"
            lastNumber = resultDouble
            resultString = ""
            switchButtons()
        }
    }
}
