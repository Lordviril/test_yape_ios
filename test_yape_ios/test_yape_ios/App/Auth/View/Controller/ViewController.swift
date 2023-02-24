//
//  ViewController.swift
//  test_yape_ios
//
//  Created by iMac on 22/02/23.
//

import UIKit
import Toast_Swift
class ViewController: UIViewController {

    @IBOutlet weak var googleButton: CustomButton!
    @IBOutlet weak var emailCustomTextField: CustomTextField!
    @IBOutlet weak var passwordCustomTextField: CustomTextField!
    @IBOutlet weak var signButton: CustomButton!

    var authViewModel: AuthViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent()
        // Do any additional setup after loading the view.
    }

    func initComponent() {
        authViewModel = AuthViewModel(authViewModelViewModelToView: self)
    }

    @IBAction func signInGoogle(button: UIButton) {
        
        authViewModel?.signInGoogle(controller: self)
    }
    
    @IBAction func signInEmail(button: UIButton) {
        if (emailCustomTextField.textFieldInput.text ?? "").isEmpty || (passwordCustomTextField.textFieldInput.text ?? "").isEmpty {
            self.view.makeToast("Please fill all fields")
            return
        }
        if !(emailCustomTextField.textFieldInput.text ?? "").isValidEmail() {
            self.view.makeToast("Please enter valid email")
        }
        authViewModel?.signInEmail(userModel: UserModel(email: (emailCustomTextField.textFieldInput.text ?? "").lowercased(), token: "", password: passwordCustomTextField.textFieldInput.text ?? ""))
    }
}
//MARK: -AuthViewModelDelegate
extension ViewController: AuthViewModelViewModelToView {
    func onCompleteGetUser(userData: UserData) {
        
    }
    
    func onShowError(error: String) {
        self.view.makeToast(error)
    }
}

