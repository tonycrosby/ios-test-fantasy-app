//
//  FeaturedPlayerTableViewCell.swift
//  FinalApp
//
//  Created by Tony Crosby on 11/28/17.
//  Copyright © 2017 Tony Crosby. All rights reserved.
//

import UIKit

class FeaturedPlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
