//
//  NetworkManager.swift
//  CoreDataSample
//
//  Created by Kanakatti Shrikant on 10/11/22.
//

import Foundation

let defaultSession = URLSession(configuration: .default)
var dataTask: URLSessionDataTask?

class NetworkManger: NSObject {

    class func getDataFromAPI(urlString: String, completionBlock :@escaping (Data,_ error: NSError?) -> ()) {
        
        if let urlComponents = URLComponents(string: urlString) {
          guard let url = urlComponents.url else {
            return
          }
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
            defer {
                dataTask = nil
            }
            if let error = error {
              print("DataTask error: " +
                                      error.localizedDescription + "\n")
            } else if
              let data = data,
              let response = response as? HTTPURLResponse,
              response.statusCode == 200 {
                completionBlock(data, nil)
            }
          }
          dataTask?.resume()
        }
    }
}
