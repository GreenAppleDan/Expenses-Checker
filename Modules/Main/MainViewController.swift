//
//  MainMainViewController.swift
//  Expenses Checker
//
//  Created by Denis on 11/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import UIKit

class MainViewController: UIViewController, MainViewProtocol {
    
    let selfToLoginSegueName = "fromExpensesToLogin"
    let selfToAddEvent = "fromMainToAddEvent"
    
    @IBAction func logOutButtonClicked(_ sender: UIBarButtonItem) {
        presenter.logOutButtonClicked()
    }
    
    @IBAction func plusButtonClicked(_ sender: UIBarButtonItem) {
        presenter.showAddEventView()
    }
    
    @IBAction func reportButtonClicked(_ sender: UIBarButtonItem) {
    }
    
    var presenter: MainPresenterProtocol!
    let configurator: MainConfiguratorProtocol = MainConfigurator()

    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
}


