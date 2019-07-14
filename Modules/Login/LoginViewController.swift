//
//  LoginLoginViewController.swift
//  Expenses Checker
//
//  Created by Denis on 10/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {
    
    let selfToExpensesSegueName = "fromLoginToExpenses"
    
    // MARK: outlets
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    
    
    var presenter: LoginPresenterProtocol!
    let configurator: LoginConfiguratorProtocol = LoginConfigurator()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    // MARK: actions
    @IBAction func loginButtonClickedLogin(_ sender: UIButton) {
        if usernameTextField.text != "" {
            presenter.loginButtonClicked(username: usernameTextField.text!)
        }
    }    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

