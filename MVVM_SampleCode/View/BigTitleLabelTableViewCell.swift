//
//  BigTitleLabelTableViewCell.swift
//  MVVM_SampleCode
//
//  Created by Woody Liu on 2021/12/24.
//

import UIKit

class BigTitleLabelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var  titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
