//
//  TopHighlightCollectionViewCell.swift
//  BugabooTV7
//
//  Created by MacDetail on 19/7/2568 BE.
//

import UIKit

class TopHighlightCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "TopHighlightCollectionViewCell"
    
    var cellData : FoodCategoryModel? {
        didSet {
            guard let cellData = cellData else {
                return
            }
            imgImageView.image = UIImage(named: cellData.categoryImage)
            titleLabel.text = cellData.categoryName
        }
    }
    
    @IBOutlet weak var topLeftUIButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgImageView: UIImageView!
    
    @IBAction func actionButton(_ sender: Any) {
        let urlString = "https://bugaboo.tv/th"
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
