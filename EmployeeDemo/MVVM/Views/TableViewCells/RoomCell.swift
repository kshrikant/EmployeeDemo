//
//  RoomCell.swift
//  CoreDataSample
//
//  Created by Kanakatti Shrikant on 10/11/22.
//

import UIKit

class RoomCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var isOccupiedImageView: UIImageView!
    @IBOutlet weak var maxOccupancyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func configure(_ employee: Room) {
        self.idLabel.text = employee.id
        let image = employee.isOccupied! ? UIImage.init(named: "Checked") : UIImage.init(named: "Unchecked")
        self.isOccupiedImageView.image = image
        self.maxOccupancyLabel.text =  "\(employee.maxOccupancy!)"
    }
}
