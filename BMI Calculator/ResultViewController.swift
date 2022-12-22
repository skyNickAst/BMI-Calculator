//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Nikolai Astakhov on 23.12.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var conclusionLabel: UILabel!
    
    var result: Float?
    lazy var resultAsString = String(format: "%.1f", result!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = resultAsString
        resultLabel.textColor = setColor(bmi: result!)
        conclusionLabel.text = setConclusion(bmi: result!)
    }
    
    func setColor(bmi: Float) -> UIColor {
        switch bmi {
        case 0...18.59:
            return .systemBlue
        case 18.6...24.99:
            return .systemGreen
        case 25.0...29.99:
            return .systemYellow
        case 30.0...34.99:
            return .systemOrange
        case 35.0...:
            return .systemRed
        default:
            return .black
        }
    }
    
    func setConclusion(bmi: Float) -> String {
        switch bmi {
        case 0...18.59:
            return "Underweight"
        case 18.6...24.99:
            return "Normal"
        case 25.0...29.99:
            return "Overweight"
        case 30.0...34.99:
            return "Obese"
        case 35.0...:
            return "Extremely Obese"
        default:
            return ""
        }
    }
    
    @IBAction func recalculateButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
