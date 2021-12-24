//
//  CellViewModelProtocol.swift
//  MVVM_SampleCode
//
//  Created by Woody Liu on 2021/12/24.
//

import UIKit

protocol ConfigurableCellViewModel {
    var identifier: String { get }
    var height: CGFloat? { get }
}

extension ConfigurableCellViewModel {
    var height: CGFloat? {
        return UITableView.automaticDimension
    }
}

protocol CellConfigurable {
    static var identifier: String { get }
    func configCell(_ viewModel: ConfigurableCellViewModel?)
}

typealias ConfigurableCell = UITableViewCell & CellConfigurable
