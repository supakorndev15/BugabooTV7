
import UIKit

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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
