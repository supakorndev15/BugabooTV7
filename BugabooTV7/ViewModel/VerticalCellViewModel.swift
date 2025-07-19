//
//  VerticalCellViewModel.swift
//  BugabooTV7
//
//  Created by MacDetail on 19/7/2568 BE.
//

import Foundation

struct VerticalCellViewModel {
    let imageName: String
    let title: String
    let subtitle: String
    let dateText: String
    
    init(model: VerticalModel) {
        self.imageName = model.coverImage
        self.title = model.name
        self.subtitle = model.categoryTags
        self.dateText = "18 กค. 68"
    }
}
