//
//  ServiceTableViewCell.swift
//  JD
//
//  Created by Arthur Nguyen on 4/27/18.
//  Copyright © 2018 Arthur Nguyen. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {
    @IBOutlet weak var serviceLists: UILabel!
    @IBOutlet weak var priceLists: UILabel!
    @IBOutlet weak var titleLists: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
