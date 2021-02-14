//
//  TrackManager.swift
//  AppleMusicStApp
//
//  Created by 조영우 on 2021/02/14.
//

import UIKit
import AVFoundation //미디어 작업에 필요한 객체

class TrackManager {
    // TODO: 프로퍼티 정의하기 - 트랙들, 앨범들, 오늘의 곡
    
    // TODO: 생성자 정의하기
    init() {
        
    }
    
    // TODO: 트랙 로드하기
    func loadTrack() -> [AVPlayerItem] {
        return []
    }
    
    // TODO: 인덱스에 맞는 트랙 로드하기
    func track(at index: Int) -> Track? {
        return nil
    }

    // TODO: 앨범 로딩메소드 구현
    func loadAlbums(tracks: [AVPlayerItem]) -> [Album]{
        []
    }
    
    // TODO: 오늘의 트랙 랜덤으로 선택
    func loadOtherTodaysTrack() {
        
    }
    
}
