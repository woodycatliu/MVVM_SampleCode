//
//  SectionFourViewModel.swift
//  MVVM_SampleCode
//
//  Created by Woody Liu on 2021/12/24.
//

import Foundation

struct SectionFourViewModel {
    let pie: SectionOneViewModel
    let list: [SectionThreeCellViewModel]

    init(data: DataModel) {
        pie = SectionOneViewModel.init(data: data)
        var array = [SectionThreeCellViewModel]()
        zip(data.firstList, data.secondList)
            .map{ $0 }
            .forEach {
                array.append(.init(title: "\($0.0) 親 \($0.1)"))
            }
        list = array
    }
}

extension SectionFourViewModel {
    var count: Int {
        return 1 + list.count
    }
}
