import UIKit

class defaultHorizontalCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "defaultHorizontalCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgImageView: UIImageView!
    @IBOutlet weak var dateTitleLabel: UILabel!
    
    func configure(with viewModel: HorizontalCellViewModel) {
        imgImageView.image = UIImage(named: viewModel.imageName)
        titleLabel.text = viewModel.title
    }
}
