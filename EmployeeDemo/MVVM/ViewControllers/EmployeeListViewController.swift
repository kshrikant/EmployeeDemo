//
//  EmployeeListViewController.swift
//  EmployeeDemo
//
//  Created by Kanakatti Shrikant on 10/11/22.
//

import UIKit

class EmployeeListViewController: UITableViewController {

    fileprivate let viewModel = EmployeeListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        viewModel.getEmployeeList {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setupTableView() {
        self.navigationItem.title = "Employees"
        self.tableView.estimatedRowHeight = 150
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.dataSource = self.viewModel
    }
}
