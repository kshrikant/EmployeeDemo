//
//  RoomListViewModel.swift
//  CoreDataSample
//
//  Created by Kanakatti Shrikant on 10/11/22.
//

import Foundation
import UIKit


class RoomListViewModel: NSObject {
    
    var rooms = [Room]()
    func refreshWith(rooms: [Room], _ completionBlock : @escaping ()->()) {
        self.rooms = rooms
        completionBlock()
    }
    
    func getRoomList(_ completionBlock : @escaping ()->()) {
        //we can make as a base URL // TODO
        NetworkManger.getDataFromAPI(urlString: "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/rooms", completionBlock: { response, error in
            do {
                let resultData = try JSONDecoder().decode([Room].self, from: response)
                self.rooms = resultData
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

extension RoomListViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell", for: indexPath as IndexPath) as! RoomCell
        let employeeViewModel = self.rooms[indexPath.row]
        cell.configure(employeeViewModel)
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
}
