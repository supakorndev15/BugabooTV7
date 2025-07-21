
import UIKit
import Kingfisher

class CatListCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "CatListCollectionViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var cellData : FoodCategoryModel? {
        didSet {
            guard let cellData = cellData else {
                return
            }
            imgImageView.image = UIImage(named: cellData.categoryImage)
            titleLabel.text = cellData.categoryName
        }
    }
    
    func configure(with menu: Menu) {
        titleLabel.text = menu.label
        loadImage(from: menu.iconURL)
    }
    
    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            imgImageView.image = UIImage(named: "placeholder")
            return
        }
        
        let placeholder = UIImage(named: "placeholder")
        let processor = DownsamplingImageProcessor(size: imgImageView.bounds.size)
        imgImageView.kf.indicatorType = .activity
        imgImageView.kf.setImage(
            with: url,
            placeholder: placeholder,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.2)),
                .cacheOriginalImage
            ]
        )
    }

}
