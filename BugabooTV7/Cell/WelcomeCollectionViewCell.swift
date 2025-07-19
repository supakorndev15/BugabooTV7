//
//  WelcomeCollectionViewCell.swift
//  BugabooTV7
//
//  Created by MacDetail on 19/7/2568 BE.
//

import UIKit

class WelcomeCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var welcomeTitleLabel: UILabel!
    @IBOutlet weak var subwelcomeTitleLabel: UILabel!
    
    static let cellIdentifier = "WelcomeCollectionViewCell"
    
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
