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
    var tracks: [AVPlayerItem] = []
    var albums: [Album] = []
    var todayMusic: AVPlayerItem?
    
    // TODO: 생성자 정의하기
    init() {
        let tracks = loadTrack()
        self.tracks = tracks
        self.albums = loadAlbums(tracks: tracks)
        self.todayMusic = self.tracks.randomElement()
    }
    
    // TODO: 트랙 로드하기
    func loadTrack() -> [AVPlayerItem] {
        // 파일을 읽어서 AVPlayerItem
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? []
        let items = urls.map { url in
            return AVPlayerItem(url: url)
        }
        return items
    }
    
    // TODO: 인덱스에 맞는 트랙 로드하기
    func track(at index: Int) -> Track? {
        // 우리는 cell을 어떻게 표현할지를 결정할 때 해당 indexPath의 아이템번째를 판단하여 해당 트랙을 반환해야 할 것이다.
        let playerItem = tracks[index]
        // 현재 playerItem의 type은 AVPlayerItem이다. 이를 Track type으로 casting해야한다.
        let track = playerItem.convertToTrack()
        return track
    }

    // TODO: 앨범 로딩메소드 구현
    func loadAlbums(tracks: [AVPlayerItem]) -> [Album]{
        []
    }
    
    // TODO: 오늘의 트랙 랜덤으로 선택
    func loadOtherTodaysTrack() {
        
    }
    
}
