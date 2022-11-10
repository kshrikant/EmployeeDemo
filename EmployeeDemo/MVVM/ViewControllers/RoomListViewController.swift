//
//  RoomListViewController.swift
//  EmployeeDemo
//
//  Created by Kanakatti Shrikant on 10/11/22.
//

import UIKit

class RoomListViewController: UITableViewController {
    
    fileprivate let viewModel = RoomListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        viewModel.getRoomList {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func setupTableView() {
        self.navigationItem.title = "Rooms"
        self.tableView.estimatedRowHeight = 120
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.dataSource = self.viewModel
    }
}
