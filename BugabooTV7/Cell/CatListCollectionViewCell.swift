
import UIKit
import Kingfisher
import SDWebImage
import SDWebImageSVGCoder

class CatListCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "CatListCollectionViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    func configure(with menu: Menu) {
        titleLabel.text = menu.label
        iconImageView.loadImage(from: menu.iconURL)
    }
}

