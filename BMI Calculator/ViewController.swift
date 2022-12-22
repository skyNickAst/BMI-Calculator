//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Nikolai Astakhov on 22.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var hightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var hightValue = 170
    var weightValue = 60
    
    
    @IBAction func hightSliderChanged(_ sender: UISlider) {
        hightValue = Int(sender.value)
        hightValueLabel.text = String("\(hightValue) sm")
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightValue = Int(sender.value)
        weightValueLabel.text = String("\(weightValue) kg")
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toResult", sender: self)
    }
    
    func calculateBMI() -> Float {
        let hightDevided = Float(hightValue) / 100
        let result = Float(weightValue) / (hightDevided * hightDevided)
        return result
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "toResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = calculateBMI()
        }
    }
}

