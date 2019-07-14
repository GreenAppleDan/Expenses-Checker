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
    var modelsArray = [EventInfoCellmodel]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func logOutButtonClicked(_ sender: UIBarButtonItem) {
        presenter.logOutButtonClicked()
    }
    
    @IBAction func plusButtonClicked(_ sender: UIBarButtonItem) {
        presenter.showAddEventView()
    }
    
    @IBAction func reportButtonClicked(_ sender: UIBarButtonItem) {
    }
    
    func updateModelsArray(_ array: [EventInfoCellmodel]){
        self.modelsArray = array
        
        tableView.reloadData()
    }
    var presenter: MainPresenterProtocol!
    let configurator: MainConfiguratorProtocol = MainConfigurator()

    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppear()
    }
    
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelsArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = modelsArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) as! EventInfoCell
        cell.model = model
        
        return cell
    }
    
    
    
    
}
