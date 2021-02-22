//
//  SimplePlayer.swift
//  AppleMusicStApp
//
//  Created by 조영우 on 2021/02/22.
//

import AVFoundation

class SimplePlayer {
    // TODO: 싱글톤 만들기, 왜 만드는 가?
    
    private let player = AVPlayer()
    
    var currentTime: Double {
        // TODO: current Time 구하기
        return 0.0
    }
    var totalDurationTime: Double {
        // TODO:total 시간 구하기
        return 0.0
    }
    var isPlaying: Bool {
        // TODO: 재생중인지 반환
        return false
    }
    var currentItem: AVPlayerItem? {
        // TODO: 현재 재생중인 아이템 반환
        return nil
    }
    
    init() {}
    
    func pause() {
        // TODO: 정지 구현
    }
    func play() {
        // TODO: 재생 구현
    }
    func seek() {
        // TODO: 원하는 시간 재생 구현 (by Silder bar)
    }
    func replaceCurrentItem(with item: AVPlayerItem?){
        // TODO: AVPlayer에서 재생할 곡 아이템을 설정하기, 갈아끼기
    }
    func addPeriodicTimeObserver(forInterval: CMTime, queue: DispatchQueue?, using: @escaping (CMTime) -> Void) {
        player.addPeriodicTimeObserver(forInterval: forInterval, queue: queue, using: using)
    }
}
