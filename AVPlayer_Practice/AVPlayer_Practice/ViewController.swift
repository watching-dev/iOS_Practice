//
//  ViewController.swift
//  ExAVPlayerLayer
//
//  Created by 김종권 on 2022/04/09.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
  private lazy var videoView: VideoView = {
    let view = VideoView(url: "https://bitmovin-a.akamaihd.net/content/art-of-motion_drm/m3u8s/11331.m3u8")
    view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .green
    self.view.addSubview(view)
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    NSLayoutConstraint.activate([
      self.videoView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 70),
      self.videoView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -70),
      self.videoView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -200),
      self.videoView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
    ])
      print("videoview: \(videoView.frame)")
      
  }
    
    
    override func viewWillAppear(_ animated: Bool) {
        videoView.player.play()
    }
}

final class VideoView: UIView {
  lazy var videoBackgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray
    view.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(view)
    return view
  }()
  private lazy var slider: UISlider = {
    let slider = UISlider()
    slider.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(slider)
    return slider
  }()
  
  var player = AVPlayer()
  var playerLayer: AVPlayerLayer?
  private let url: String
  
  init(url: String) {
    self.url = url
    super.init(frame: .zero)
    
    NSLayoutConstraint.activate([
      self.videoBackgroundView.leftAnchor.constraint(equalTo: self.leftAnchor),
      self.videoBackgroundView.rightAnchor.constraint(equalTo: self.rightAnchor),
      self.videoBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
      self.videoBackgroundView.topAnchor.constraint(equalTo: self.topAnchor),
    ])
    
    NSLayoutConstraint.activate([
      self.slider.topAnchor.constraint(equalTo: self.videoBackgroundView.bottomAnchor, constant: 16),
      self.slider.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
      self.slider.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
    ])
  
    guard let url = URL(string: self.url) else { return }
    let asset = AVAsset(url: url)
    let item = AVPlayerItem(asset: asset)
    self.player.replaceCurrentItem(with: item)
    let playerLayer = AVPlayerLayer(player: self.player)
    playerLayer.frame = self.videoBackgroundView.bounds
    playerLayer.videoGravity = .resizeAspectFill
    self.playerLayer = playerLayer
    self.videoBackgroundView.layer.addSublayer(playerLayer)
      print("playerLayer : \(playerLayer.frame), videoBackgroundView.bounds: \(self.videoBackgroundView.bounds)")
//    self.player.play()
    
    if self.player.currentItem?.status == .readyToPlay {
      self.slider.minimumValue = 0
      self.slider.maximumValue = Float(CMTimeGetSeconds(item.duration))
    }
    
    self.slider.addTarget(self, action: #selector(changeValue), for: .valueChanged)
    
    let interval = CMTimeMakeWithSeconds(1, preferredTimescale: Int32(NSEC_PER_SEC))
    self.player.addPeriodicTimeObserver(forInterval: interval, queue: .main, using: { [weak self] elapsedSeconds in
      let elapsedTimeSecondsFloat = CMTimeGetSeconds(elapsedSeconds)
      let totalTimeSecondsFloat = CMTimeGetSeconds(self?.player.currentItem?.duration ?? CMTimeMake(value: 1, timescale: 1))
      print(elapsedTimeSecondsFloat, totalTimeSecondsFloat)
    })
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    print("layoutSubviews")
      self.playerLayer?.frame = self.videoBackgroundView.bounds
  }
  
  @objc private func changeValue() {
    self.player.seek(to: CMTime(seconds: Double(self.slider.value), preferredTimescale: Int32(NSEC_PER_SEC)), completionHandler: { _ in
      print("completion")
    })
  }
}

extension ViewController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
        print("frame: \(self.videoView.playerLayer?.frame), bounds: \(self.videoView.bounds)")
        self.videoView.frame = self.videoView.bounds
        print("frame: \(self.videoView.frame), bounds: \(self.videoView.bounds)")
        self.videoView.frame.origin = CGPoint(x: 100, y: 100)
    }
}

class Vvvv2: UIViewController {
    
    var video: String?
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    var yView =  UIView()
    var playerItem: AVPlayerItem!
    
    var playerView =  PlayerView()
    
    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        //super.init(coder: coder) 이것도 됨
        super.init(coder: coder)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let videoURL = URL(string: "https://bitmovin-a.akamaihd.net/content/art-of-motion_drm/m3u8s/11331.m3u8") else { return }
        playerItem = AVPlayerItem(url: videoURL)
        player = AVPlayer(playerItem: playerItem)
        player.replaceCurrentItem(with: playerItem)
        playerView.player = player
        playerLayer = AVPlayerLayer(player: playerView.player)
        playerLayer.videoGravity = .resizeAspectFill
//        playerLayer.frame = CGRectMake(0, 0, 300, 600)
        playerLayer.frame = self.view.frame

                 
        playerView.layer.addSublayer(playerLayer)
        
        
//        yView.layer.addSublayer(playerLayer)
//        self.view.addSubview(yView)
//        yView.frame = CGRect(x: 0, y: 0, width: 300, height: 600)
//
//
//        playerLayer.frame = yView.bounds
        
        
        
        self.view.addSubview(playerView)
                NSLayoutConstraint.activate([
                    self.playerView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                    self.playerView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
                    self.playerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
                    self.playerView.topAnchor.constraint(equalTo: self.view.topAnchor),
                ])
        
        playerView.backgroundColor = .yellow
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player.play()
    }
    
    override func viewDidLayoutSubviews() {            // subView인 playerLayer의 영역 설정
         super.viewDidLayoutSubviews()
         playerLayer.frame = playerView.bounds
     }
}

/// A view that displays the visual contents of a player object.
class PlayerView: UIView {


    // Override the property to make AVPlayerLayer the view's backing layer.
    override static var layerClass: AnyClass { AVPlayerLayer.self }
    
    // The associated player object.
    var player: AVPlayer? {
        get { playerLayer.player }
        set { playerLayer.player = newValue }
    }
    
    private var playerLayer: AVPlayerLayer { layer as! AVPlayerLayer }
    
}
