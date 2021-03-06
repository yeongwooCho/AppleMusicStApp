//
//  HomeViewController.swift
//  AppleMusicStApp
//
//  Created by 조영우 on 2021/02/14.
//

import UIKit

class HomeViewController: UIViewController {
    
    let trackManager: TrackManager = TrackManager()
    
//    TODO: 트랙관리 객체추가
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    // 셀 몇개를 표시할 것인가?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: 트랙매니져에서 트랙갯수 가져오기
        return trackManager.tracks.count
    }
    
    // 셀을 어떻게 표현할 것인가?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 셀 구성하기
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackCollectionViewCell", for: indexPath) as? TrackCollectionViewCell else {
            return UICollectionViewCell()
        }
        
//        여기서 cell의 UI를 업데이트하는 작업이 필요하다
        let track = trackManager.track(at: indexPath.item)
        cell.updateUI(item: track)
        return cell
    }
    
    // headerView를 어떻게 표시할 것인가?
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // TODO: 헤더 구성하기
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let item = trackManager.todayMusic else {
                return UICollectionReusableView()
            }
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TrackCollectionHeaderView", for: indexPath) as? TrackCollectionHeaderView else {
                return UICollectionReusableView()
            }
            
            header.update(with: item)
            header.tapHandler = { item -> Void in
                // TODO: 탭이 되었을 때 플레이어를 띄운다.
                let playStoryboard = UIStoryboard.init(name: "Player", bundle: nil)
                guard let playerVC = playStoryboard.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else {
                    return
                }
                playerVC.simplePlayer.replaceCurrentItem(with: item)
                self.present(playerVC, animated: true, completion: nil)
//                print("----> item title : \(item.convertToTrack()?.title)")
            }
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    // 셀을 클릭했을때 어떤 action을 취할까?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: 곡 클릭시 플레이어뷰 띄우기
        let playStoryboard = UIStoryboard.init(name: "Player", bundle: nil)
        guard let playerVC = playStoryboard.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else {
            return
        }
        let item = trackManager.tracks[indexPath.item]
        playerVC.simplePlayer.replaceCurrentItem(with: item)
        present(playerVC, animated: true, completion: nil)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    // 셀 사이즈 어떻게 할 것인가?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // TODO: 셀사이즈 구해서 return
        // 20 - card - 20 - card - 20
        let itemSpacing: CGFloat = 20
        let margin: CGFloat = 20
        let width: CGFloat = (collectionView.bounds.width - itemSpacing - margin * 2)/2
        let height: CGFloat = width + 60
        return CGSize(width: width, height: height)
    }
}
    
