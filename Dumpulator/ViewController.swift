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
    var rounded: Bool = false
    let preResultNumber: Double? = nil
    var buttons = [0: "1", 1: "2", 2: "3", 3: "/", 4 : "4", 5 : "5", 6 : "6", 7 : "*", 8 : "7", 9 : "8", 10: "9", 11: "-", 12: "0", 13: ",", 14: "=", 15 : "+"]
    var buttonsValues = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "/", "*", "-", "+", "=", ","]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultDisplay.text? = resultString
        updateTextFont()
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
        resetAll()
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
    
    @IBOutlet weak var roundedWarning: UITextField!
    
    
    
    // Functions
    func updateDisplay() {
        var output = resultString
        output = output.replacingOccurrences(of: ".", with: ",")
        updateTextFont()
        resultDisplay.text? = output
        showRoundedWarning()
    }
    
    func showRoundedWarning() {
        if rounded {
            roundedWarning.text? = "."
        } else {
            roundedWarning.text? = ""
        }
    }
    
    func markButton() {
        // Step 1: unmark old Button
        // Step 2: mark new Button
    }
    
    func convertString() {
        
        var tempResultDouble = resultDouble
        let decimal = Decimal(resultDouble).significantFractionalDecimalDigits
        
        if (tempResultDouble > Double(Int.max)) {
            print("The result is reseted")
            resetAll()
        } else {
            if decimal > 4 {
                tempResultDouble = (round(tempResultDouble * 10000) / 10000)
                resultString = String(tempResultDouble)
                if resultString == "0.0" {
                    resultString = "0.0001"
                }
                rounded = true
            } else {
                if (Double(Int(tempResultDouble)) - tempResultDouble) == 0 {
                    resultString = String(Int(tempResultDouble))
                } else {
                    resultString = String(tempResultDouble)
                }
                rounded = false
            }
        }
    }
    
    func resetAll() {
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
        showAlert(name: "Error!", text: "Der gewählte Wert ist leider zu groß. Der Dumpulator wird wieder zurückgesetzt.")
    }
    
    func switchButtons() {
        buttonsValues = buttonsValues.shuffled()
        for i in 0...15 {
            buttons[i] = buttonsValues[i]
        }
        button00.setTitle("", for: .normal)
        button01.setTitle("", for: .normal)
        button02.setTitle("", for: .normal)
        button03.setTitle("", for: .normal)
        button04.setTitle("", for: .normal)
        button05.setTitle("", for: .normal)
        button06.setTitle("", for: .normal)
        button07.setTitle("", for: .normal)
        button08.setTitle("", for: .normal)
        button09.setTitle("", for: .normal)
        button10.setTitle("", for: .normal)
        button11.setTitle("", for: .normal)
        button12.setTitle("", for: .normal)
        button13.setTitle("", for: .normal)
        button14.setTitle("", for: .normal)
        button15.setTitle("", for: .normal)
        
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
            convertString()
            updateDisplay()
        case ""  :
            convertString()
            updateDisplay()
        default :
            resetAll()
        }
    }
    
    func pressButton(id: Int) {
        if (Int(buttons[id]!) != nil) {
            if currentMode == "=" {
                resultString = ""
                currentMode = ""
                rounded = false
            }
            resultString += String(buttons[id]!)
            resultDouble = Double(resultString)!
            updateDisplay()
        } else if buttons[id] == "=" {
            calculate(opearation: currentMode)
            markButton()
            currentMode = "="
            lastNumber = resultDouble
        } else if buttons[id] == "," {
            if !resultString.contains(".") {
                if currentMode == "=" {
                    resultString = "0."
                    currentMode = ""
                    rounded = false
                } else {
                    resultString += "."
                }
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
    
    func updateTextFont() {
        var fontSize: Double = 60.0
        var font = UIFont.systemFont(ofSize: fontSize)
        var textAttributes = [NSAttributedString.Key.font: font]
        let text = resultString
        var textWidth = (text as NSString).size(withAttributes: textAttributes).width
        let availableWidth = resultDisplay.frame.width
        if (textWidth + 20) > availableWidth {
            while (textWidth + 20) > availableWidth {
                fontSize -= 1.0
                font = UIFont.systemFont(ofSize: fontSize)
                textAttributes = [NSAttributedString.Key.font: font]
                textWidth = (text as NSString).size(withAttributes: textAttributes).width
            }
            resultDisplay.font = UIFont.systemFont(ofSize: fontSize)
        } else {
            resultDisplay.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
    
    func showAlert(name: String, text: String) {
        let alert = UIAlertController(title: name, message: text, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Alles klar!",
                                      style: UIAlertAction.Style.default,
                                      handler: { _ in}
                                     ))
            self.present(alert, animated: true, completion: nil)
        }
}

extension Decimal {
    var significantFractionalDecimalDigits: Int {
        return max(-exponent, 0)
    }
}
