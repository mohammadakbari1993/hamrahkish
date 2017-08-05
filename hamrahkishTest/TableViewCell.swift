//
//  TableViewCell.swift
//  hamrahkishTest
//
//  Created by MacBook Pro on 1396/5/13 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var Lblid: UILabel!
     @IBOutlet weak var Lbltitle: UILabel!
    @IBOutlet weak var Lblcategory: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
