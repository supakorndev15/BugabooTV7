
import UIKit
import Kingfisher
//import KingfisherSVG

class CatListCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "CatListCollectionViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    func configure(with menu: Menu) {
        titleLabel.text = menu.label
//        loadImage(from: menu.iconURL)
        guard let url = URL(string: "https://static.bugaboo.tv/mobile/images/super-app/icon/icon_shopping_bag_01.svg") else { return }
        iconImageView.kf.setImage(with: url)
        print("url : \(url)")
    }
    
    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            iconImageView.image = UIImage(named: "magnifyingglass")
            return
        }
        
        print("url : \(url)")
        let placeholder = UIImage(named: "placeholder")
        let processor = DownsamplingImageProcessor(size: iconImageView.bounds.size)
        iconImageView.kf.indicatorType = .activity
        iconImageView.kf.setImage(
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
