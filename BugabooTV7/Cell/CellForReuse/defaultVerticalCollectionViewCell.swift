//
//  defaultVerticalCollectionViewCell.swift
//  BugabooTV7
//
//  Created by MacDetail on 19/7/2568 BE.
//

import UIKit

class defaultVerticalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dateTitleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var imgImageView: UIImageView!
    
    static let cellIdentifier = "defaultVerticalCollectionViewCell"
    
    func configure(with viewModel: VerticalCellViewModel) {
        imgImageView.image = UIImage(named: viewModel.imageName)
        dateTitleLabel.text = viewModel.dateText
        subTitleLabel.text = viewModel.title
    }
}

