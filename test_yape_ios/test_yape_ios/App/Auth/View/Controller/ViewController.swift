//
//  ViewController.swift
//  test_yape_ios
//
//  Created by iMac on 22/02/23.
//

import UIKit

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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    @IBAction func signInGoogle(button: UIButton) {
        
        authViewModel?.signInGoogle(controller: self)
    }
    
    @IBAction func signInEmail(button: UIButton) {
        if (emailCustomTextField.textFieldInput.text ?? "").isEmpty || (passwordCustomTextField.textFieldInput.text ?? "").isEmpty {
            AlertsNative.showSimpleAlertNoAction(contorller: self, titleText: "Error", subTitleText: "Por favor llene todos los campos")
            return
        }
        authViewModel?.signInEmail(userModel: UserModel(email: emailCustomTextField.textFieldInput.text ?? "", token: "", password: passwordCustomTextField.textFieldInput.text ?? ""))
    }
}
//MARK: -AuthViewModelDelegate
extension ViewController: AuthViewModelViewModelToView {
    func onCompleteGetUser(userData: UserData) {
        
    }
    
    func onShowError(error: String) {
        
    }
}

