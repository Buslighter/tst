//
//  SettingsTableViewCell.swift
//  hw10.tables+collections
//
//  Created by gleba on 18.12.2021.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var arrowButton: UIButton!
    @IBOutlet weak var iconNameLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
