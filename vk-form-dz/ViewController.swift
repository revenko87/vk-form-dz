//
//  ViewController.swift
//  vk-form-dz
//
//  Created by Александр Ревенко on 04.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Field: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupTextFields()
    }
    
    @IBAction func button(_ sender: Any) {
       
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "loginSegue" else {return false}
        if checkForValidationData() {
            return true
        } else {
           
            showAlert()
            return false
            
        }
        
        
    }
}

private extension ViewController {
  
    func SetupTextFields() {
        Field.keyboardType = .emailAddress
        loginTextField.keyboardType = .numberPad
    }
    
    func checkForValidationData() -> Bool {
        guard let loginText = Field.text, let passwordText = loginTextField.text else {
            return false
        }
        let isValidData = loginText == "" && passwordText == ""
        return isValidData
     
        }
    
    func showAlert() {
        
        let alertViewController = UIAlertController(title: "Ошибка", message: "Вы ввели неверные данные", preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            self.loginTextField.text = ""
            self.Field.text = ""
        })
        alertViewController.addAction(doneButton)
        
        present(alertViewController, animated: true, completion: nil)
    }
    }
    

