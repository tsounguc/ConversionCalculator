//
//  ViewController.swift
//  Hw3
//
//  Created by user158049 on 9/24/19.
//  Copyright © 2019 Christian Tsoungui Nkoulou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var yardsField: UITextField!
    @IBOutlet weak var metersField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
            self.view.addGestureRecognizer(detectTouch)
    }
    
    
    @IBAction func yardFieldDidBeginEditing(_ sender: UITextField) {
        metersField.text = ""
    }
    
    
    @IBAction func meterFieldDidBeginEditing(_ sender: UITextField) {
        yardsField.text = ""
    }
    
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        yardsField.text = ""
        metersField.text = ""
    }
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        if let y = self.yardsField.text, let m = metersField.text{
            var result: Double
            if y != "" {
                result = Double(y)! / 1.0936
                self.metersField.text = "\(result)"
            }
            else if m != "" {
                result = Double(m)! * 1.0936
                self.yardsField.text = "\(result)"
            }
            
        }
        self.dismissKeyboard()
    }		
    
    @IBAction func modeButtonTapped(_ sender: UIButton) {
         
    }
    
}

