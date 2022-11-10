//
//  UIImageViewExtension.swift
//  EmployeeDemo
//
//  Created by Kanakatti Shrikant on 10/11/22.
//

import Foundation
import UIKit

extension UIImageView {

    public func imageFromServerURL(urlString: String, PlaceHolderImage:UIImage) {
        if self.image == nil{
              self.image = PlaceHolderImage
        }

        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })

        }).resume()
    }
    
    public func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
    }
}
