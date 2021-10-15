//
//  ViewController.swift
//  Coordinator-1
//
//  Created by ViceCode on 14.10.2021.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var employeeTableView: UITableView!
    @IBOutlet weak var dataSegmentedControl: UISegmentedControl!

    // главный координатор
    weak var coordinator: MainCoorinator?
    
    // ViewModel данных
    private var employeeViewModel: EmployeeViewModel!
    
    // свой DataSource
    private var dataSource: EmployeeTableViewDataSource<EmployeeTableViewCell,EmployeeData>!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
    }
    
    // обновление данных из ViewModel
    func callToViewModelForUIUpdate() {
        self.employeeViewModel = EmployeeViewModel()
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }
    
    // обновление DataSource таблицы и данных в ячейке
    func updateDataSource() {
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell",
                                                      items: self.employeeViewModel.empData.data,
                                                      configureCell: { cell, data in
                                                        cell.employeeIdLabel.text = "\(data.id)"
                                                        cell.employeeNameLabel.text = data.employeeName
                                                      })
        DispatchQueue.main.async {
            self.employeeTableView.dataSource = self.dataSource
            self.employeeTableView.reloadData()
        }
    }
    
    // обновление ViewModel
    @IBAction func segmentedIndexTapped(_ sender: UISegmentedControl) {
        employeeViewModel.selectedIndex = sender.selectedSegmentIndex
    }
    // показ нового экран с помощью дочернего координатора
    @IBAction func buyTapped(_ sender: Any) {
        employeeViewModel.showBuyVC(coordinator: coordinator)
    }
    // показ нового экрана с помощью главного координатора
    @IBAction func createAccountapped(_ sender: Any) {
        coordinator?.createAccount()
    }
    
}

