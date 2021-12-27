//
//  IntegateViewModel.swift
//  MVVM_SampleCode
//
//  Created by Woody Liu on 2021/12/24.
//

import Foundation
import Combine

class IntegateViewModel {
    
    enum SectionType: Int, CaseIterable {
        case one, two, three, four
    }
    
    var sectionCount: Int {
        SectionType.allCases.count
    }
    
    private var cancellBag = Set<AnyCancellable>()

    @Published
    private var oneSectionData: SectionOneViewModel? = nil
    
    @Published
    private var twoSectionData: SectionTwoViewModel?
    
    @Published
    private var threeSectionData: SectionThreeViewModel?
    
    @Published
    private var fourSectionData: SectionFourViewModel?
    
    var reload: AnyPublisher<Void, Never>?
    
}

// MARK: Binding
extension IntegateViewModel {
    
    private func binding() {
        
        reload = Publishers.CombineLatest4($oneSectionData, $twoSectionData, $threeSectionData, $fourSectionData)
            .dropFirst()
            .map({ _, _, _, _ in
                return ()
            })
            .eraseToAnyPublisher()
        
    }
    
}

extension IntegateViewModel {
    
    private var oneSectionCount: Int {
        return 1
    }
    
    private var twoSectionCount: Int {
        return twoSectionData?.list.count ?? 0
    }
    
    private var threeSectionCount: Int {
        return threeSectionData?.list.count ?? 0
    }
    
    private var fourSectionCount: Int {
        return fourSectionData?.count ?? 0
    }
    
    func numberOfRows(_ indexPath: IndexPath)-> Int {
        guard let type = SectionType.init(rawValue: indexPath.section)
        else { return 0 }

        let count: Int
        
        switch type {
        case .one:
            count = oneSectionCount
        case .two:
            count = twoSectionCount
        case .three:count =
            threeSectionCount
        case .four:
            count = fourSectionCount
        }
        return count
    }
}

extension IntegateViewModel {
    
    func cellViewModel(_ indexPath: IndexPath)-> ConfigurableCellViewModel? {
        guard let type = SectionType.init(rawValue: indexPath.section)
        else { return nil }
        switch type {
        case .one:
            return getOneCellViewModel(indexPath)
        case .two:
            return getTwoCellViewModel(indexPath)
        case .three:
            return getThreeCellViewModel(indexPath)
        case .four:
            return getFourCellViewModel(indexPath)
        }
    }
    
    private func getOneCellViewModel(_ indexPath: IndexPath)-> ConfigurableCellViewModel? {
        return oneSectionData
    }
    
    private func getTwoCellViewModel(_ indexPath: IndexPath)-> ConfigurableCellViewModel? {
        guard let list = twoSectionData?.list,
              list.indices.contains(indexPath.row) else { return nil }
        return list[indexPath.row]
    }
    
    private func getThreeCellViewModel(_ indexPath: IndexPath)-> ConfigurableCellViewModel? {
        guard let list = threeSectionData?.list,
              list.indices.contains(indexPath.row) else { return nil }
        return list[indexPath.row]    }
    
    private func getFourCellViewModel(_ indexPath: IndexPath)-> ConfigurableCellViewModel? {
        guard let viewModel = fourSectionData else { return nil }
        if indexPath.row == 0 {
            return viewModel.pie
        }
        else if viewModel.list.indices.contains(indexPath.row - 1) {
            return viewModel.list[indexPath.row - 1]
        }
        return nil
    }
    
}

// MARK: API
extension IntegateViewModel {
    
    private func fetch() {
        
        APIService.fetchData()
            .sink(receiveCompletion: { _ in}, receiveValue: {
                self.createViewModel($0)
            })
            .store(in: &cancellBag)
        
    }
    
    private func createViewModel(_ data: DataModel) {
        oneSectionData = .init(data: data)
        twoSectionData = .init(data: data)
        threeSectionData = .init(data: data)
        fourSectionData = .init(data: data)
    }
}
