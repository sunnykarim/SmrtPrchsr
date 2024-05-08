//
//  AddProductViewController.swift
//  FinalProjectApp
//
//  Created by Sunny Karim on 1/6/21.
//

import UIKit

class AddProductViewController: UIViewController, UITextFieldDelegate{

    
    weak var delegate: ViewControllerDelegate?
    @IBOutlet weak var pT: UITextField!
    @IBOutlet weak var pN: UITextField!
    @IBOutlet weak var pP: UITextField!
    @IBOutlet weak var pS: UITextField!
    @IBOutlet weak var pDP: UITextField!
    @IBOutlet weak var pR: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pT.delegate = self
        pN.delegate = self
        pP.delegate = self
        pS.delegate = self
        pDP.delegate = self
        pR.delegate = self
    }
    
    // dismiss keyboard for phone numbes by touching out of it
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //pP.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check if going to 3rd vc
        let p = Product(productType: pT.text!, productName: pN.text!, productPrice: Double(pP.text!)!, retailer: pR.text!, datePurchased: pDP.text!, numDaysRtrn: pR.text!)
        print(p.productName)
        delegate?.updateProducts(p: p)
    }
}
