//
//  EventCell.swift
//  Rendezvous
//
//  Created by MediaLab on 4/26/16.
//  Copyright © 2016 GeddingtonDr. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    
    var event: Event!{
        didSet {
            nameLabel.text = event.name
            locationLabel.text = event.locationName
            
            var date = event.startingTime!
            
            let calendar = NSCalendar.currentCalendar()
            var components = calendar.components([.Day , .Month , .Year], fromDate: date)
            
            startDateLabel.text = "\(components.month)/\(components.day)/\(components.year)"
            
            components = calendar.components([.Hour, .Minute], fromDate: date)
            
            var timeOfDay = ""
            
            if components.hour >= 12 {
                timeOfDay = "PM"
            } else {
                timeOfDay = "AM"
            }
            
            startTimeLabel.text = "\(components.hour%12):\(components.minute) \(timeOfDay)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
