//
//  LiveCh7PlayerCollectionViewCell.swift
//  BugabooTV7
//
//  Created by MacDetail on 18/7/2568 BE.
//

import UIKit
import AVFoundation

class LiveCh7PlayerCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "LiveCh7PlayerCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    var cellData : FoodCategoryModel? {
        didSet {
            guard let cellData = cellData else { return }
            imageView.image = UIImage(named: cellData.categoryImage)
        }
    }
    
    func configure(with viewModel: Channel) {
//        imageView.loadImage(from: viewModel.imageUrl)
    }
    
//    private var player: AVPlayer?
//    private var playerLayer: AVPlayerLayer?
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        setupPlayer()
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        playerLayer?.frame = imageView.bounds
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        player?.pause()
//        playerLayer?.removeFromSuperlayer()
//        player = nil
//        playerLayer = nil
//    }
//    
//    
//    private func setupPlayer() {
//        let urlString = "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"
//        guard let url = URL(string: urlString) else {
//            print("❌ URL ไม่ถูกต้อง")
//            return
//        }
//
//        player = AVPlayer(url: url)
//        player?.automaticallyWaitsToMinimizeStalling = false
//        player?.isMuted = true
//
//        playerLayer = AVPlayerLayer(player: player)
//        guard let playerLayer = playerLayer else { return }
//
//        playerLayer.videoGravity = .resizeAspectFill
//        playerLayer.frame = imageView.bounds
//        imageView.layer.insertSublayer(playerLayer, at: 0)
//
//        player?.play()
//    }

}
