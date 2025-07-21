import UIKit
import Kingfisher
import SDWebImage
import SDWebImageSVGCoder

extension UIImageView {
    func loadImage(from urlString: String,
                   placeholderName: String = "placeholder",
                   fallbackImageName: String = "ic_app") {
        
        guard let url = URL(string: urlString) else {
            self.image = UIImage(named: fallbackImageName)
            return
        }

        print("โหลดรูปจาก: \(url)")

        if url.pathExtension.lowercased() == "svg" {
            self.sd_setImage(with: url, placeholderImage: UIImage(named: fallbackImageName))
        } else {
            let processor = DownsamplingImageProcessor(size: self.bounds.size)
            self.kf.indicatorType = .activity
            self.kf.setImage(
                with: url,
                placeholder: UIImage(named: placeholderName),
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
