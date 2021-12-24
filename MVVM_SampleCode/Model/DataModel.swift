//
//  DataModel.swift
//  MVVM_SampleCode
//
//  Created by Woody Liu on 2021/12/24.
//

import Foundation

/// I am  really Codable
struct DataModel: Codable {
    let firstList: [String]
    let secondList: [String]
    let values: [Int]
    let battles: [Battle]
}

struct Battle: Codable {
    let right: Int
    let left: Int
}

