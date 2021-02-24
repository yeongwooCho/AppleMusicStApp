//
//  SimplePlayer.swift
//  AppleMusicStApp
//
//  Created by 조영우 on 2021/02/22.
//

import AVFoundation

class SimplePlayer {
    // TODO: 싱글톤 만들기, 왜 만드는 가?
    static let shared = SimplePlayer()
    
    private let player = AVPlayer()
    
    var currentTime: Double {
        // TODO: current Time 구하기
        return player.currentItem?.currentTime().seconds ?? 0
    }
    var totalDurationTime: Double {
        // TODO:total 시간 구하기
        player.currentItem?.currentTime()
        return player.currentItem?.duration.seconds ?? 0
    }
    var isPlaying: Bool {
        // TODO: 재생중인지 반환
        return player.isPlaying
    }
    var currentItem: AVPlayerItem? {
        // TODO: 현재 재생중인 아이템 반환
        return player.currentItem
    }
    
    init() {}
    
    func pause() {
        // TODO: 정지 구현
        player.pause()
    }
    func play() {
        // TODO: 재생 구현
        player.play()
    }
    func seek(to time: CMTime) {
        // TODO: 원하는 시간 재생 구현 (by Silder bar)
        player.seek(to: time)
    }
    func replaceCurrentItem(with item: AVPlayerItem?){
        // TODO: AVPlayer에서 재생할 곡 아이템을 설정하기, 갈아끼기
        player.replaceCurrentItem(with: item)
    }
    func addPeriodicTimeObserver(forInterval: CMTime, queue: DispatchQueue?, using: @escaping (CMTime) -> Void) {
        player.addPeriodicTimeObserver(forInterval: forInterval, queue: queue, using: using)
    }
}
