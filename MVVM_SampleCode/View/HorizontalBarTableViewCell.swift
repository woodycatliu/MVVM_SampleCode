//
//  HorizontalBarTableViewCell.swift
//  MVVM_SampleCode
//
//  Created by Woody Liu on 2021/12/24.
//

import UIKit

class HorizontalBarTableViewCell: ConfigurableCell {
    static var identifier: String = HorizontalBarTableViewCell.description()
    
    @IBOutlet weak var barView: HorizontalBarView! {
        didSet {
            barView.backgroundColor = .systemGray5
        }
    }
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBOutlet weak var leftLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(_ viewModel: ConfigurableCellViewModel?) {
        guard let viewModel = viewModel as? SectionTwoCellViewModel else {
            return }
        barView.setBarValue(right: viewModel.right, left: viewModel.left)
    }
    
}
