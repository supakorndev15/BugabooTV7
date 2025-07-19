//
//  LiveCh7PlayerCollectionViewCell.swift
//  BugabooTV7
//
//  Created by MacDetail on 18/7/2568 BE.
//

import UIKit
import AVKit
import AVFoundation

class LiveCh7PlayerCollectionViewCell: UICollectionViewCell {
    
    // https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4
    
    //    guard let videoURL = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") else { return }
    
    var playerLooper: AVPlayerLooper?
    var queuePlayer: AVQueuePlayer?
    var playerViewController = AVPlayerViewController()
    
    static let cellIdentifier = "LiveCh7PlayerCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    //    var cellData : FoodCategoryModel? {
    //        didSet {
    //            guard let cellData = cellData else { return }
    //            imageView.image = UIImage(named: cellData.categoryImage)
    //        }
    //    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupPlayer()
    }

    private func setupPlayer() {
        // https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4
        
        guard let videoURL = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") else {
            print("Invalid video URL")
            return
        }
        
        // สร้าง PlayerItem
        let playerItem = AVPlayerItem(url: videoURL)
        
        // สร้าง Queue Player และ Looper เพื่อให้เล่นวน
        queuePlayer = AVQueuePlayer()
        playerLooper = AVPlayerLooper(player: queuePlayer!, templateItem: playerItem)
        
        // กำหนดให้ AVPlayerViewController ใช้ queuePlayer
        playerViewController.player = queuePlayer
        playerViewController.showsPlaybackControls = true // ซ่อนปุ่มควบคุม
        
        // นำ View ของ AVPlayerViewController มาแสดงใน cell
        contentView.addSubview(playerViewController.view)
        playerViewController.view.frame = contentView.bounds
        playerViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // เล่นวิดีโอทันที
        playVideo()

    }
    
    func playVideo() {
        queuePlayer?.play()
        queuePlayer?.isMuted = false
        print("PLAY VDO")
    }

    func stopVideo() {
        print("🛑 STOP called")
        queuePlayer?.pause()
        queuePlayer?.removeAllItems()
        playerLooper = nil
        queuePlayer = nil
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
