//
//  ScoreTableViewCell.swift
//  SampleTableView
//
//  Created by Kamaraj on 26/03/18.
//  Copyright © 2018 sabari. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {

    @IBOutlet weak var switchScore: UISwitch!
    @IBOutlet weak var totalScore : UILabel!
     @IBOutlet weak var detailScore : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
