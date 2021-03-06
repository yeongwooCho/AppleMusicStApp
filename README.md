# AppleMusicStApp
AVPlayer를 활용한 음악 어플리케이션


**학습한 내용**

+ Dark Mode
  - Pretty mod provided in ios13 and above

~~~
import UIKit

public enum DefaultStyle {
    public enum Colors {
        public static let tint: UIColor = {
            if #available(iOS 13.0, *) {
                return UIColor { traitCollection in
                    if traitCollection.userInterfaceStyle == .dark {
                        return .white
                    } else {
                        return .black
                    }
                }
            } else {
                return .black
            }
        }()
    }
}
~~~

+ AVPlayer
  - AVFoundation: Media Framework
  - AVPlayer: player
  - AVPlayerItem: Object for player
  - Singleton Object: Similar to the declaration of a global variable, it is an object that can be called anywhere.
  - present: Data can be moved without segues.
  - Slider Control: Update the Slider by observing the periodic time using 'addPeriodicTimeObserver'
  - Seeking: Control the player by changing the slider's value.

+ MVVM Design Patten (Model - View - ViewModel)
  - Implement Track, TrackManager, TrackViewModel for viewModel

+ CollectionView
  - custom cell, dequeueReusableCell
  - CollectionViewDataSource: How to represent cell?
  - CollectionViewDelegate: What do you do when a cell is clicked?
  - UICollectionViewDelegateFlowLayout: Calculate cell size
  - CollectionReusableView (section header view): separate Header, Footer from viewForSupplementaryElementOfKind


**결과물**

> 감코블로그: https://yeongwoo-cho.tistory.com/category/IOS%20application/Apple%20Music%20%28project%29


**저작권**
> fastcampus: https://www.fastcampus.co.kr/

> 이준원: https://github.com/cafielo

