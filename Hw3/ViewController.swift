//
//  ViewController.swift
//  Hw3
//
//  Created by user158049 on 9/24/19.
//  Copyright © 2019 Christian Tsoungui Nkoulou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var FromTextField: DecimalMinusTextField!
    
    @IBOutlet weak var ToTextFied: DecimalMinusTextField!
    @IBOutlet weak var FromLabel: UILabel!
    @IBOutlet weak var ToLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    var calculatorMode: CalculatorMode = .Length
    var fromLengthUnits: LengthUnit = LengthUnit.Meters
    var toLengthUnits: LengthUnit = LengthUnit.Yards
    var fromVolumeUnits: VolumeUnit = VolumeUnit.Liters
    var toVolumeUnits: VolumeUnit = VolumeUnit.Gallons
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
            self.view.addGestureRecognizer(detectTouch)
        self.title = "Length Conversion Calculator"
    }
    
    
    @IBAction func yardFieldDidBeginEditing(_ sender: UITextField) {
        ToTextFied.text = ""
    }
    
    
    @IBAction func meterFieldDidBeginEditing(_ sender: UITextField) {
        FromTextField.text = ""
    }
    
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        FromTextField.text = ""
        ToTextFied.text = ""
    }
    
    
    @IBAction func modeButtonTapped(_ sender: UIButton) {
        switch calculatorMode {
    case .Volume:
        calculatorMode = .Length
        FromTextField.placeholder = "Enter length in \(fromLengthUnits.rawValue)"
        ToTextFied.placeholder = "Enter length in \(toLengthUnits.rawValue)"
        TitleLabel.text = "Length Conversion Calculator"
        FromLabel.text = fromVolumeUnits.rawValue
        ToLabel.text = toVolumeUnits.rawValue
    case .Length:
        calculatorMode = .Volume
        FromTextField.placeholder = "Enter volume in \(fromVolumeUnits.rawValue)"
        ToTextFied.placeholder = "Enter volume in \(toVolumeUnits.rawValue)"
        TitleLabel.text = "Volume Conversion Calculator"
        FromLabel.text = fromLengthUnits.rawValue
        ToLabel.text = toLengthUnits.rawValue
           
        
        
        }
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        if let y = self.FromTextField.text, let m = ToTextFied.text{
            var result: Double
            if y != "" {
                result = Double(y)! / 1.0936
                self.ToTextFied.text = "\(result)"
            }
            else if m != "" {
                result = Double(m)! * 1.0936
                self.FromTextField.text = "\(result)"
            }
            
        }
        self.dismissKeyboard()
    }		
    
    
}

