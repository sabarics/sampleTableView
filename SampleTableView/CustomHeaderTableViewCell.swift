//
//  CustomHeaderTableViewCell.swift
//  SampleTableView
//
//  Created by Kamaraj on 27/03/18.
//  Copyright © 2018 sabari. All rights reserved.
//

import UIKit

class CustomHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sectioName : UILabel!
    @IBOutlet weak var selectBut: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
