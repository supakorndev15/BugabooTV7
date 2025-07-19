//
//  CatListCollectionViewCell.swift
//  BugabooTV7
//
//  Created by MacDetail on 19/7/2568 BE.
//

import UIKit

class CatListCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "CatListCollectionViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgImageView: UIImageView!
    
    var cellData : FoodCategoryModel? {
        didSet {
            guard let cellData = cellData else {
                return
            }
            imgImageView.image = UIImage(named: cellData.categoryImage)
            titleLabel.text = cellData.categoryName
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
