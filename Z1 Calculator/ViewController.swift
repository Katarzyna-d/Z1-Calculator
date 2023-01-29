//
//  ViewController.swift
//  Z1 Calculator
//
//  Created by user225913 on 1/29/23.
//

import UIKit

class ViewController: UIViewController {
//    @IBOutlet weak var button1: UIButton!
//    @IBOutlet weak var wynik: UILabel!
    
    
    
    
    @IBOutlet weak var CalResults: UILabel!
    @IBOutlet weak var CalWorking: UILabel!
    
    var workings:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        wynik.text = "0"
        clearAll()
        }
    
    //    @IBAction func pressButton(_ sender: Any) {
    //        wynik.text = String(Int(wynik.text!)! + 1)
    //    }
    
    func clearAll(){
        workings = ""
        CalWorking.text = ""
        CalResults.text = ""
    }
    
    @IBAction func equalTo(_ sender: Any) {
        if(validInput())
        {
            let checkedWorkingForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatRes(result: result)
            CalResults.text = resultString
        }
        else
        {
            let alert = UIAlertController( title: "Invalid Input", message: "Calculator unable to do math based on input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput()->Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            
            if(index == workings.count - 1)
            {
                return false
            }
            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    func specialCharacter(char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }
    
    func formatRes (result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }

    
    @IBAction func allClear(_ sender: Any) {
        clearAll()
    }
    @IBAction func back(_ sender: Any) {
        if(!workings.isEmpty)
        { workings.removeLast()
            CalWorking.text = workings
        }
    }
    func addToWorkings(value: String)
    {
        workings = workings + value
        CalWorking.text = workings
    }
    @IBAction func Percent(_ sender: Any) {
        addToWorkings(value: "%")
    }
    @IBAction func Divide(_ sender: Any) {
        addToWorkings(value: "/")
    }
    @IBAction func Times(_ sender: Any) {
        addToWorkings(value: "*")
    }
    @IBAction func Minus(_ sender: Any) {
        addToWorkings(value: "-")
    }
    @IBAction func Plus(_ sender: Any) {
        addToWorkings(value: "+")
    }

    @IBAction func Zero(_ sender: Any) {
        addToWorkings(value: "0")
    }
    @IBAction func Dot(_ sender: Any) {
        addToWorkings(value: ".")
    }
    @IBAction func One(_ sender: Any) {
        addToWorkings(value: "1")
    }
    @IBAction func Two(_ sender: Any) {
        addToWorkings(value: "2")
    }
    @IBAction func Three(_ sender: Any) {
        addToWorkings(value: "3")
    }
    @IBAction func Four(_ sender: Any) {
        addToWorkings(value: "4")
    }
    @IBAction func Five(_ sender: Any) {
        addToWorkings(value: "5")
    }
    @IBAction func Six(_ sender: Any) {
        addToWorkings(value: "6")
    }
    @IBAction func Sevn(_ sender: Any) {
        addToWorkings(value: "7")
    }
    @IBAction func Eight(_ sender: Any) {
        addToWorkings(value: "8")
    }
    @IBAction func Nine(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
    
    
    
    
    
    
}

