//
//  BigTitleLabelTableViewCell.swift
//  MVVM_SampleCode
//
//  Created by Woody Liu on 2021/12/24.
//

import UIKit

class BigTitleLabelTableViewCell: ConfigurableCell {
    static var identifier: String = BigTitleLabelTableViewCell.description()
    
    @IBOutlet weak var  titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(_ viewModel: ConfigurableCellViewModel?) {
        guard let viewModel = viewModel as? SectionThreeCellViewModel else {
            return
        }
        titleLabel.text = viewModel.title
    }
    
    
}
