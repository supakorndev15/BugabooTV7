//
//  SectionDecorationView.swift
//  BugabooTV7
//
//  Created by MacDetail on 18/7/2568 BE.
//

import Foundation
import UIKit

class SectionDecorationView: UICollectionReusableView {
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        self.backgroundColor = .lightGray.withAlphaComponent(0.2)
        layer.cornerRadius = 20
    }
    
}
