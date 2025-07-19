import Foundation
import UIKit

class SectionDecorationView: UICollectionReusableView {
    // MARK: MAIN
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS
    func setUpViews() {
        // ลบสีพื้นหลังเก่าออก
        self.backgroundColor = .clear
        
        // สร้าง UIImageView จากภาพ
        let backgroundImageView = UIImageView(image: UIImage(named: "highlight-content-overlay-bg"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.alpha = 0.9
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // แทรก UIImageView ไปไว้ด้านหลังสุดของ view
        self.insertSubview(backgroundImageView, at: 0)
        
        // ปรับให้เต็มขนาด view
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        //        self.backgroundColor = .blue.withAlphaComponent(0.2)
        // ปรับมุมโค้งเหมือนเดิม
        self.layer.cornerRadius = 0
        self.layer.masksToBounds = true
    }
}
