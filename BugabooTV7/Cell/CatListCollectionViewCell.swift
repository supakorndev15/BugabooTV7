
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
        loadImage(from: menu.iconURL)
    }
    
    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            iconImageView.image = UIImage(named: "placeholder")
            return
        }

        print("โหลดรูปจาก: \(url)")
        
        if url.pathExtension.lowercased() == "svg" {
            // ใช้ SDWebImage โหลด SVG
            iconImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "ic_app"))
        } else {
            // ใช้ Kingfisher โหลด PNG/JPG
            let processor = DownsamplingImageProcessor(size: iconImageView.bounds.size)
            let placeholder = UIImage(named: "placeholder")
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
}

