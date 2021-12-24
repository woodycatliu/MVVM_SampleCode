//
//  SectionOneViewModel.swift
//  MVVM_SampleCode
//
//  Created by Woody Liu on 2021/12/24.
//

import Foundation


struct SectionOneViewModel: ConfigurableCellViewModel {
    var identifier: String = PieChartViewTableViewCell.identifier

    let values: [Int]

    init(data: DataModel) {
        self.values = data.values
    }
}
