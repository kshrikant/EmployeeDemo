//
//  EmployeeListViewModel.swift
//  CoreDataSample
//
//  Created by Kanakatti Shrikant on 10/11/22.
//

import Foundation
import UIKit


class EmployeeListViewModel: NSObject {
    
    var employees = [Employee]()
    func refreshWith(employees: [Employee], _ completionBlock : @escaping ()->()) {
        self.employees = employees
        completionBlock()
    }
    
    func getEmployeeList(_ completionBlock : @escaping ()->()) {
        //we can make as a base URL // TODO
        NetworkManger.getDataFromAPI(urlString: "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/people", completionBlock: { response, error in
            do {
                let resultData = try JSONDecoder().decode([Employee].self, from: response)
                self.employees = resultData
                completionBlock()
            } catch let parseError {
                print("JSON Error \(parseError.localizedDescription)")
            }
            if error != nil {
                //Show error
            }
        })
    }
}

extension EmployeeListViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath as IndexPath) as! EmployeeCell
        let employeeViewModel = self.employees[indexPath.row]
        cell.configure(employeeViewModel)
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
}
