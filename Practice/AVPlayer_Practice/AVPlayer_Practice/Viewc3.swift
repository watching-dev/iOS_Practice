//
//  ViewController.swift
//  NetflixPlayer
//
//  Created by Pushpendra on 29/06/23.
//

import UIKit
import AVKit

class ViewController3: UIViewController {
    
//    let videoURL = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
//    let videoURL = "https://bitmovin-a.akamaihd.net/content/art-of-motion_drm/m3u8s/11331.m3u8"
    let videoURL = "https://storage.googleapis.com/srplayervideo/video/production/transcoded/rural-long/rural-rp.m3u8"
    
    var videoPlayer = CustomV()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoPlayer.frame = CGRect(x: 0, y: 0, width: 300, height: 600)
        
        self.view.addSubview(videoPlayer)
        videoPlayer.backgroundColor = .lightGray
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setVideoPlayer()
    }
    
    private var player : AVPlayer? = nil
    private var playerLayer : AVPlayerLayer? = nil
    
    
    
    private func setVideoPlayer() {
        guard let url = URL(string: videoURL) else { return }
        
        if self.player == nil {
            let playitem = AVPlayerItem(url: url)
            self.videoPlayer.player = AVPlayer(playerItem: playitem)
            
            
//            self.playerLayer = AVPlayerLayer(player: self.player)
            self.videoPlayer.playerLayer.frame = self.videoPlayer.bounds
//            if let playerLayer = self.playerLayer {
                self.view.layer.addSublayer(self.videoPlayer.playerLayer)
//            }
            self.videoPlayer.player?.play()
        }
    }
}

class CustomV: UIView {
    
    override class var layerClass: AnyClass {
        
        return AVPlayerLayer.self
    }
    
    var playerLayer: AVPlayerLayer {
        
        let layer = layer as! AVPlayerLayer
        layer.videoGravity = .resizeAspectFill
        return layer
    }
    
    var player: AVPlayer? {
        
        get {
            
            return playerLayer.player
        }
        
        set {
            
            playerLayer.player = newValue
        }
    }
}
