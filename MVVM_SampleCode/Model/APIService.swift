//
//  APIService.swift
//  MVVM_SampleCode
//
//  Created by Woody Liu on 2021/12/24.
//

import Foundation
import Combine

let JSONString: String = """
{
  "firstList": [
    "蜘蛛人",
    "知豬人",
    "肢豬人",
    "吃豬人",
    "支那人",
    "吃屁人"
  ],
  "secondList": [
    "蝙蝠俠",
    "扁福俠",
    "鞭福俠",
    "福覺得委屈"
  ],
  "values": [
    10,
    20,
    22,
    4,
    6,
    33,
    21,
    63,
    12
  ],
  "battles": [
    {
      "right": 10,
      "left": 5
    },
    {
      "right": 2,
      "left": 3
    },
    {
      "right": 10,
      "left": 5
    },
    {
      "right": 38,
      "left": 34
    },
    {
      "right": 43,
      "left": 51
    },
    {
      "right": 22,
      "left": 3
    }
  ]
}
"""

class APIService {}

extension APIService {
    
    class func fetchData()-> AnyPublisher<DataModel, Shit> {
        return  Future<DataModel, Shit> {
            promiss in
            guard let data = JSONString.data(using: .utf8),
                  let dataModel = try? JSONDecoder().decode(DataModel.self, from: data)
            else {
                promiss(.failure(.decodeFailed))
                return
            }
            promiss(.success(dataModel))
        }.eraseToAnyPublisher()
    }
}


enum Shit: Error {
    case decodeFailed
}
