//
//  ViewController.swift
//  FinalProjectApp
//
//  Created by Sunny Karim on 12/28/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var signIn: UIButton!
    
    var uStrLength = 0
    var pStrLength = 0
    var currentCount = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        user.delegate = self
        pass.delegate = self
        signIn.isEnabled = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // close keyboard
        textField.resignFirstResponder()
        // return
        return true
    }
    
    @IBAction func clickButton(_ sender: UIButton) {
        user.resignFirstResponder()
        pass.resignFirstResponder()
    }

    @IBAction func textValueChanged(_ sender: UITextField)
    {
        print(sender.text!)
       if sender == user {
           uStrLength = sender.text!.count
       }
       if sender == pass {
           pStrLength = sender.text!.count
       }
      if validate(text: user.text!, text2: pass.text!)
       {
            signIn.isEnabled = true
      }
    }
    
    func validate(text:String,text2:String) -> Bool {
        return text.count >= 8 && text2.count >= 8
    }
    
    @IBAction func myUnwindAction(segue: UIStoryboardSegue)
    {
        
    }
}

