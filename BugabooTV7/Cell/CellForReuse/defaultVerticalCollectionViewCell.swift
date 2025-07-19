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
    
    var cellData : VerticalModel? {
        didSet {
            guard let cellData = cellData else {
                return
            }
            imgImageView.image = UIImage(named: cellData.coverImage)
            dateTitleLabel.text = "18 กค. 68"//cellData.name
            subTitleLabel.text = cellData.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
