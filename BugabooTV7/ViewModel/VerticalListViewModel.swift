//
//  VerticalListViewModel.swift
//  BugabooTV7
//
//  Created by MacDetail on 19/7/2568 BE.
//

import Foundation

class VerticalListViewModel {
    private var items: [VerticalModel] = verticalMockData // API

    func numberOfItems() -> Int {
        return items.count
    }

    func viewModel(at index: Int) -> VerticalCellViewModel {
        return VerticalCellViewModel(model: items[index])
    }
}
