import UIKit

class TopHighlightCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "TopHighlightCollectionViewCell"

    @IBOutlet weak var topLeftUIButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgImageView: UIImageView!
    
    @IBAction func actionButton(_ sender: Any) {
        let urlString = "https://bugaboo.tv/th"
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func configure(with menu: MainMenuItem) {
        titleLabel.text = menu.title
        imgImageView.loadImage(from: menu.imageURL.medium,
                               placeholderName: "loading",
                               fallbackImageName: "default")
    }
}

