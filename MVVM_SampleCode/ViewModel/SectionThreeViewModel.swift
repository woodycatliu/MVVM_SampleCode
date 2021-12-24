//
//  SectionThreeViewModel.swift
//  MVVM_SampleCode
//
//  Created by Woody Liu on 2021/12/24.
//

import Foundation

struct SectionThreeViewModel {
    let list: [SectionThreeCellViewModel]
    init(data: DataModel) {
        var arr = [SectionThreeCellViewModel]()
        data.firstList.forEach {
            arr.append(.init(title: $0))
        }
        list = arr
    }
}

struct SectionThreeCellViewModel: ConfigurableCellViewModel {
    var identifier: String = BigTitleLabelTableViewCell.identifier
    let title: String
}
