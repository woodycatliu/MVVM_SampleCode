//
//  SectionTwoViewModel.swift
//  MVVM_SampleCode
//
//  Created by Woody Liu on 2021/12/24.
//

import Foundation


struct SectionTwoViewModel {
    let list: [SectionTwoCellViewModel]
    
    init(data: DataModel) {
        
        let rightValues: [Int] = data.values
        let leftValues: [Int] = data.values.reversed()
        
        var array = [SectionTwoCellViewModel]()
        zip(rightValues, leftValues).map{$0}
        .forEach{
            array.append(.init(left: $0.0, right: $0.1))
        }
        list = array
    }
}

struct SectionTwoCellViewModel: ConfigurableCellViewModel {
    var identifier: String = HorizontalBarTableViewCell.identifier
    let left: Int
    let right: Int
}
