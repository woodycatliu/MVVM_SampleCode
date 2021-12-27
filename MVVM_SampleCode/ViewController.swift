//
//  ViewController.swift
//  MVVM_SampleCode
//
//  Created by Woody Liu on 2021/12/24.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    private var cancellBag = Set<AnyCancellable>()
    
    private let viewModel: IntegateViewModel = IntegateViewModel()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(UINib(nibName: "PieChartViewTableViewCell", bundle: nil), forCellReuseIdentifier: PieChartViewTableViewCell.identifier)
        tv.register(UINib(nibName: "HorizontalBarTableViewCell", bundle: nil), forCellReuseIdentifier: HorizontalBarTableViewCell.identifier)
        tv.register(UINib(nibName: "BigTitleLabelTableViewCell", bundle: nil), forCellReuseIdentifier: BigTitleLabelTableViewCell.identifier)
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        binding()
        viewModel.fetch()
    }

}

extension ViewController {
    private func binding() {
        viewModel.reload?
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: {
                self.tableView.reloadData()
            }).store(in: &cancellBag)
    }
}

// MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModel = viewModel.cellViewModel(indexPath),
              let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.identifier, for: indexPath) as? ConfigurableCell
        else { fatalError("Cell is missing") }
        cell.configCell(cellViewModel)
        return cell
    }
}
 
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.cellViewModel(indexPath)?.height ?? UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.header(section)
        
    }
}
