//
//  PieChartViewTableViewCell.swift
//  MVVM_SampleCode
//
//  Created by Woody Liu on 2021/12/24.
//

import UIKit
import Combine

class PieChartViewTableViewCell: ConfigurableCell {
    static var identifier: String = PieChartViewTableViewCell.description()

    
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
    
    func configCell(_ viewModel: ConfigurableCellViewModel?) {
        guard let viewModel = viewModel as? SectionOneViewModel else { return }
        pieChartView.setValues(values: viewModel.values)
    }
    
}
