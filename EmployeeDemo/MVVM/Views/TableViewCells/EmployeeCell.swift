//
//  EmployeeCell.swift
//  CoreDataSample
//
//  Created by Kanakatti Shrikant on 10/11/22.
//

import UIKit

class EmployeeCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var favouriteColorLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.avatarImage.setRounded()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func configure(_ employee: Employee) {
        self.firstNameLabel.text = employee.firstName
        self.lastNameLabel.text = employee.lastName
        self.emailLabel.text = employee.email
        self.jobTitleLabel.text = employee.jobtitle
        self.favouriteColorLabel.text = employee.favouriteColor
        self.idLabel.text = "Id - \(employee.id!)"
        if let avatarImageURL = employee.avatar {
            self.avatarImage?.imageFromServerURL(urlString: avatarImageURL, PlaceHolderImage: UIImage.init(named: "ProfileAvatar")!)
        }
    }
}
