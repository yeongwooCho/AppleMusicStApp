//
//  PlayerViewController.swift
//  AppleMusicStApp
//
//  Created by 조영우 on 2021/02/22.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var totalDurationLabel: UILabel!
    @IBOutlet weak var playControlButton: UIButton!
    
    // TODO: SimplePlayer를 만들고 프로퍼티를 추가 (AVPlayer 동작)
    let simplePlayer = SimplePlayer.shared
    
    var timeObserver: Any?
    var isSeeking: Bool = false
    
    // load 되었을 때 호출
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updatePlayButton()
        updateTime(time: CMTime.zero)
        
        // TODO: TimeObserver 구현
        timeObserver = simplePlayer.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 10), queue: DispatchQueue.main, using: { time in
            self.updateTime(time: time)
        })
    }
    
    // 보이기 전에 호출
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTintColor()
        updateTrackInfo()
    }
    
    // 사리지기 전에 호출
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // TODO: 뷰나갈때 처리 > 심플플레이어
        simplePlayer.pause()
        simplePlayer.replaceCurrentItem(with: nil)
    }
    
    @IBAction func beginDrag(_ sender: UISlider) {
        isSeeking = true
    }
    @IBAction func endDrag(_ sender: UISlider) {
        isSeeking = false
    }
    @IBAction func seek(_ sender: UISlider) {
        // TODO: 시킹 구현
        guard let currentItem = simplePlayer.currentItem else {return}
        let position = Double(sender.value)
        let seconds = position * currentItem.duration.seconds
        let time = CMTime(seconds: seconds, preferredTimescale: 100)
        simplePlayer.seek(to: time)
    }
    @IBAction func togglePlayButton(_ sender: UIButton) {
        // TODO: 플레이버튼 toggle 구현
        if simplePlayer.isPlaying {
            simplePlayer.pause()
        } else {
            simplePlayer.play()
        }
        updatePlayButton()
    }
}


extension PlayerViewController {
    func updateTrackInfo() {
        // TODO: 트랙정보 업데이트, 받은 정보를 갖고 PlayViewController의 정보 업데이트
        guard let track = simplePlayer.currentItem?.convertToTrack() else {return}
        thumbnailImageView.image = track.artwork
        titleLabel.text = track.title
        artistLabel.text = track.artist
    }
    
    func updateTintColor() {
//        playControlButton.tintColor = DefaultStyle.Color.tint
//        timeSlider.tintColor = DefaultStyle.Color.tint
    }
    
    func updateTime(time: CMTime) {
        // print(time.seconds)
        // currentTime label, totalDuration label, slider
        
        // TODO: 시간정보 업데이트, 심플 플레이어 이용해서 수정
        currentTimeLabel.text = secondToString(sec: simplePlayer.currentTime) // 3.1234 >> 00:03
        totalDurationLabel.text = secondToString(sec: simplePlayer.totalDurationTime) // 39.2045 >> 00:39
        
        if isSeeking == false {
            // 노래 들으면서 시킹하면 자꾸 업데이트 됨. 따라서 시킹이 아닐때만 슬라이더 업데이트하자
            // TODO: 슬라이더 정보 업데이트
            timeSlider.value = Float(simplePlayer.currentTime/simplePlayer.totalDurationTime)
        }
    }
    
    func secondToString(sec: Double) -> String {
        guard sec.isNaN == false else { return "00:00" }
        let totalSeconds = Int(sec)
        let min = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", min, seconds)
    }
    
    func updatePlayButton() {
        // TODO: 플레이 버튼 업데이트 UI작업 > 재생 / 멈춤
        if simplePlayer.isPlaying {
            let configuration = UIImage.SymbolConfiguration(pointSize: 40)
            let image = UIImage(systemName: "pause.fill", withConfiguration: configuration)
            playControlButton.setImage(image, for: .normal)
        } else {
            let configuration = UIImage.SymbolConfiguration(pointSize: 40)
            let image = UIImage(systemName: "play.fill", withConfiguration: configuration)
            playControlButton.setImage(image, for: .normal)
        }
    }
}


