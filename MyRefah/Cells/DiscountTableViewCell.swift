//
//  DiscountTableViewCell.swift
//  MyRefah
//
//  Created by tisa refah on 8/5/18.
//  Copyright © 2018 tisa refah. All rights reserved.
//

import UIKit
import DCKit

class DiscountTableViewCell: UITableViewCell {

    @IBOutlet weak var leftButton: DCBorderedButton!
    
    @IBOutlet weak var rightButton: DCBorderedButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
