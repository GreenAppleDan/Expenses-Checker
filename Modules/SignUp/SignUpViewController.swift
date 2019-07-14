//
//  SignUpSignUpViewController.swift
//  Expenses Checker
//
//  Created by Denis on 10/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import UIKit

class SignUpViewController: UIViewController, SignUpViewProtocol {
    // MARK: Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: Actions
    
    @IBAction func closebuttonClicked(_ sender: UIBarButtonItem) {
        presenter.closeButtonClicked()
    }
    
    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        if emailTextField.text != "" , passwordTextField.text != "" {
            presenter.signUpButtonClicked(email: emailTextField.text! , password: passwordTextField.text!)
        }
    }
    
    var presenter: SignUpPresenterProtocol!
    let configurator: SignUpConfiguratorProtocol = SignUpConfigurator()

    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
}


