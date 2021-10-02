//
//  ViewController.swift
//  Hello iOS
//
//  Created by Friedrich Völkers on 29.09.21.
//

import UIKit
import MessageUI
import SafariServices

class ViewController:  UIViewController, MFMailComposeViewControllerDelegate {
    
    var resultString: String = ""
    var resultDouble: Double = 0.0
    var lastNumber: Double = 0.0
    var currentMode = ""
    var rounded: Bool = false
    let preResultNumber: Double? = nil
    var buttons = [0: "1", 1: "2", 2: "3", 3: "/", 4 : "4", 5 : "5", 6 : "6", 7 : "*", 8 : "7", 9 : "8", 10: "9", 11: "-", 12: "0", 13: ",", 14: "=", 15 : "+"]
    var buttonsValues = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "/", "*", "-", "+", "=", ","]
    var lastButtonWasOperation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .unspecified
        showRoundedWarning()
        menuButton.setTitle("", for: .normal)
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
    
    @IBOutlet weak var menuButton: UIButton!
    @IBAction func pressMenuButton(_ sender: Any) {
        showMenu()
    }
    
    @IBOutlet weak var roundedWarning: UIImageView!
    
    // Functions
    func updateDisplay(showDecimalpoint: Bool) {
        var output = resultString
        output = output.replacingOccurrences(of: ".", with: ",")
        var preDecimalPoint: String
        var postDecimalPoint: String
        var preDecimalPointModified: String = ""
        let outputArray = output.components(separatedBy: ",")
        preDecimalPoint = outputArray[0]
        if outputArray.count == 2 {
            postDecimalPoint = outputArray[1]
        } else {
            postDecimalPoint = ""
        }
        var countToThree: Int = 0
        for char in preDecimalPoint.reversed() {
            if countToThree == 2 {
                preDecimalPointModified += String(char)
                preDecimalPointModified += "."
                countToThree = -1
            } else {
                preDecimalPointModified += String(char)
            }
            countToThree += 1
        }
        preDecimalPoint = ""
        for char in preDecimalPointModified.reversed() {
            preDecimalPoint += String(char)
        }
        
        if preDecimalPoint.first == "." {
            preDecimalPoint.remove(at: preDecimalPoint.startIndex)
        }
        if postDecimalPoint != "" {
            if checkIfNumberIsToLong(number: preDecimalPoint, tryToAdd: true) {
                output = preDecimalPoint + "," + postDecimalPoint
            } else {
                output = preDecimalPoint
            }
        } else {
            if showDecimalpoint {
                output = preDecimalPoint + ","
            } else {
                output = preDecimalPoint
            }
        }
        updateTextFont()
        resultDisplay.text? = output
        showRoundedWarning()
    }
    
    func showRoundedWarning() {
        if rounded {
            roundedWarning.self.isHidden = false
            //roundedWarning.text? = "."
        } else {
            roundedWarning.self.isHidden = true
            //roundedWarning.text? = ""
        }
    }
    
    func markButton() {
        // Step 1: unmark old Button
        // Step 2: mark new Button
    }
    
    func convertString() {
        let tempResultDouble = resultDouble
        if resultDouble > 999999999.0 || resultDouble < 0.00000001 {
            resultString = tempResultDouble.scientificFormatted
            rounded = true
        } else if checkIfNumberIsToLong(number: String(resultDouble), tryToAdd: false) {
            if (Double(Int(tempResultDouble)) - tempResultDouble) == 0 {
                resultString = String(Int(tempResultDouble))
            } else {
                resultString = String(tempResultDouble)
            }
            rounded = false
        } else {
            let tempResultString = String(tempResultDouble)
            let outputArray = tempResultString.components(separatedBy: ".")
            //let numberOfPreDecimalNumbers = outputArray[0].count
            let numberPostDecimalNumbers = 9 - outputArray[0].count
            resultString = String((round(tempResultDouble * pow(10, Double(numberPostDecimalNumbers))) / pow(10, Double(numberPostDecimalNumbers))))
            rounded = true
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
        rounded = false
        updateDisplay(showDecimalpoint: false)
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
            updateDisplay(showDecimalpoint: false)
        case "-" :
            resultDouble = lastNumber - resultDouble
            resultString = String(resultDouble)
            convertString()
            updateDisplay(showDecimalpoint: false)
        case "*" :
            resultDouble = lastNumber * resultDouble
            resultString = String(resultDouble)
            convertString()
            updateDisplay(showDecimalpoint: false)
        case "/" :
            if resultDouble == 0.0 {
                resetAll()
                showAlert(name: "Error!", text: "It is not allowed to divide by zero! The \"Dumpulator\" is reset again.")
            } else {
                resultDouble = lastNumber / resultDouble
                resultString = String(resultDouble)
                convertString()
                updateDisplay(showDecimalpoint: false)

            }
        case "=" :
            convertString()
            updateDisplay(showDecimalpoint: false)
        case ""  :
            convertString()
            updateDisplay(showDecimalpoint: false)
        default :
            resetAll()
            showAlert(name: "Error!", text: "Incorrect input! The \"Dumpulator\" is reset again.")
        }
    }
    
    func pressButton(id: Int) {
        if (Int(buttons[id]!) != nil) {
            if currentMode == "=" {
                resultString = ""
                currentMode = ""
                rounded = false
            }
            if checkIfNumberIsToLong(number: nil, tryToAdd: true) {
                resultString += String(buttons[id]!)
                resultDouble = Double(resultString)!
            }
            if resultString.contains(",") {
                updateDisplay(showDecimalpoint: true)
            } else {
                updateDisplay(showDecimalpoint: false)
            }
            lastButtonWasOperation = false
        } else if buttons[id] == "=" {
            calculate(opearation: currentMode)
            markButton()
            currentMode = "="
            lastNumber = resultDouble
            resultString = ""
            lastButtonWasOperation = true
        } else if buttons[id] == "," {
            //print("String: ", resultString, "Double: ", resultDouble, "Mode: ", currentMode)
            if !resultString.contains(".") {
                if currentMode == "=" && checkIfNumberIsToLong(number: nil, tryToAdd: true) {
                    resultString = "0."
                    currentMode = ""
                    rounded = false
                } else {
                    if checkIfNumberIsToLong(number: nil, tryToAdd: true) {
                        if resultString == "" {
                            resultString = "0."
                        } else {
                            resultString += "."
                        }
                    }
                }
                updateDisplay(showDecimalpoint: true)
            }
            lastButtonWasOperation = false
            //switchButtons()
        } else if buttons[id] == "+" {
            if lastButtonWasOperation {
                currentMode = "+"
            } else {
                calculate(opearation: currentMode)
                markButton()
                currentMode = "+"
                lastNumber = resultDouble
                resultString = ""
                switchButtons()
            }
            lastButtonWasOperation = true
        } else if buttons[id] == "-" {
            if lastButtonWasOperation {
                currentMode = "-"
            } else {
                calculate(opearation: currentMode)
                markButton()
                currentMode = "-"
                lastNumber = resultDouble
                resultString = ""
                switchButtons()
            }
            lastButtonWasOperation = true
        } else if buttons[id] == "*" {
            if lastButtonWasOperation {
                currentMode = "*"
            } else {
                calculate(opearation: currentMode)
                markButton()
                currentMode = "*"
                lastNumber = resultDouble
                resultString = ""
                switchButtons()
            }
            lastButtonWasOperation = true
        } else if buttons[id] == "/" {
            if lastButtonWasOperation {
                currentMode = "/"
            } else {
                calculate(opearation: currentMode)
                markButton()
                currentMode = "/"
                lastNumber = resultDouble
                resultString = ""
                switchButtons()
            }
            lastButtonWasOperation = true
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

        alert.addAction(UIAlertAction(title: "Okay!",
                                      style: UIAlertAction.Style.default,
                                      handler: { _ in}
                                     ))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showMenu() {
        let alert = UIAlertController(title: "Menu", message: "Note: If the red dot is lit, the displayed result is rounded. The calculation is continued with the non-rounded result.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Informationen",
                                      style: UIAlertAction.Style.default,
                                      handler: {[self](alert: UIAlertAction!) in self.showInformations()}
                                     ))
        alert.addAction(UIAlertAction(title: "Display options",
                                      style: UIAlertAction.Style.default,
                                      handler: {[self](alert: UIAlertAction!) in self.showSetting()}
                                     ))
        alert.addAction(UIAlertAction(title: "Back",
                                      style: UIAlertAction.Style.default,
                                      handler: { _ in}
                                     ))
        alert.addAction(UIAlertAction(title: "Reset",
                                      style: UIAlertAction.Style.destructive,
                                      handler: {[self](alert: UIAlertAction!) in self.resetMenu()}
                                     ))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showInformations() {
        let alert = UIAlertController(title: "Information", message: "The project \"Dumpulator\" is an open source project. For further development a pull request can be created in the GitHub repository.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Back",
                                      style: UIAlertAction.Style.default,
                                      handler: { _ in}
                                     ))
        /*
        alert.addAction(UIAlertAction(title: "E-Mail",
                                      style: UIAlertAction.Style.default,
                                      handler: {[self](alert: UIAlertAction!) in self.sendEmail()}
                                     ))
         */
        alert.addAction(UIAlertAction(title: "GitHub Repository",
                                      style: UIAlertAction.Style.default,
                                      handler: {[self](alert: UIAlertAction!) in self.visitGitHUb()}
                                     ))

        self.present(alert, animated: true, completion: nil)
    }
    
    func showSetting() {
        let alert = UIAlertController(title: "Display options", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Automattic",
                                      style: UIAlertAction.Style.default,
                                      handler: {[self](alert: UIAlertAction!) in self.autoDarkmode()}
                                     ))
        alert.addAction(UIAlertAction(title: "Bright appearanced",
                                      style: UIAlertAction.Style.default,
                                      handler: {[self](alert: UIAlertAction!) in self.onlyBright()}
                                     ))
        alert.addAction(UIAlertAction(title: "Dark appearance",
                                      style: UIAlertAction.Style.default,
                                      handler: {[self](alert: UIAlertAction!) in self.onlyDark()}
                                     ))

        self.present(alert, animated: true, completion: nil)
    }
    
    func resetMenu() {
        resetAll()
        showAlert(name: "Hinweis!", text: "Der Dumpulator wird wieder zurückgesetzt.")
    }
    
    func visitGitHUb() {
        let url = URL(string: "https://github.com/frievoe97/dumpulator")
        let vc = SFSafariViewController(url: url!)
        present(vc, animated: true)
    }
    
    func sendEmail() {
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        } else {
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
             
            // Configure the fields of the interface.
            composeVC.setToRecipients(["dontUse@me.com"])
            composeVC.setSubject("Dumpulator Feedback")
             
            // Present the view controller modally.
            self.present(composeVC, animated: true, completion: nil)
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    func checkIfNumberIsToLong(number: String?, tryToAdd: Bool) -> Bool {
        var value: String = ""
        var minNumber = 9
        if !tryToAdd {
            minNumber = 10
        }
        if number != nil {
            value = number!
        } else {
            value = resultString
        }
        let tempResult: String
        let outputArray = value.components(separatedBy: ".")
        if outputArray.count > 1 && outputArray[1] == "0" {
            tempResult = outputArray[0]
        } else {
            tempResult = value.replacingOccurrences(of: ".", with: "")
        }
        if tempResult.count >= minNumber {
            return false
        } else {
            return true
        }
    }
    
    func onlyDark() {
        overrideUserInterfaceStyle = .dark
    }
    
    func onlyBright() {
        overrideUserInterfaceStyle = .light
    }
    
    func autoDarkmode() {
        overrideUserInterfaceStyle = .unspecified
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    

}

extension Decimal {
    var significantFractionalDecimalDigits: Int {
        return max(-exponent, 0)
    }
}

extension Formatter {
    static let scientific: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.positiveFormat = "0.###E+0"
        formatter.exponentSymbol = "e"
        return formatter
    }()
}

extension Numeric {
    var scientificFormatted: String {
        return Formatter.scientific.string(for: self) ?? ""
    }
}
