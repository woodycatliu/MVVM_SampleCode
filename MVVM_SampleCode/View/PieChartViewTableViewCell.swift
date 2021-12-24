//
//  PieChartViewTableViewCell.swift
//  MVVM_SampleCode
//
//  Created by Woody Liu on 2021/12/24.
//

import UIKit
import Combine

class PieChartViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pieChartView: PieChartView! {
        didSet {
            pieChartView.backgroundColor = .systemGray5
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
