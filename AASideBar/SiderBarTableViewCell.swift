//
//  SiderBarTableViewCell.swift
//  passenger
//
//  Created by chista imac on 2/23/1396 AP.
//  Copyright © 1396 amir Ardalan. All rights reserved.
//

import UIKit

class SiderBarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemImg: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
