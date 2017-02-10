//
//  Cell.swift
//  EzClosure
//
//  Created by iOS Student on 2/10/17.
//  Copyright © 2017 tek4fun. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
