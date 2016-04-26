//
//  MainTableViewCell.swift
//  Rendezvous
//
//  Created by MediaLab on 3/23/16.
//  Copyright © 2016 GeddingtonDr. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var vertex: Vertex? {
        didSet {
            nameLabel.text = vertex!.user.name
            statusLabel.text = vertex!.user.status
            //profileImageView.image = vertex!.user.image
        }
    }
    
    var user: User! {
        didSet {
            if let name = user.name {
                nameLabel.text = name
            } else {
                nameLabel.text = user.username
            }
            
            if let status = user.status {
                statusLabel.text = status
            } else {
                statusLabel.text = "No status available"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 30
        profileImageView.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
