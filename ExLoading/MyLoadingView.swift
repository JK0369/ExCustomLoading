//
//  MyLoadingView.swift
//  ExLoading
//
//  Created by 김종권 on 2022/05/22.
//

import UIKit
import Lottie
import SnapKit

final class MyLoadingView: UIView {
  private let contentView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.alpha = 0
    return view
  }()
  private let loadingView: AnimationView = {
    let view = AnimationView(name: "loading_ball")
    view.loopMode = .loop
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .black.withAlphaComponent(0.3)
    
    self.addSubview(self.contentView)
    self.contentView.addSubview(self.loadingView)
    
    self.contentView.snp.makeConstraints {
      $0.center.equalTo(self.safeAreaLayoutGuide)
    }
    self.loadingView.snp.makeConstraints {
      $0.center.equalTo(self.safeAreaLayoutGuide)
      $0.size.equalTo(300)
    }
  }
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  func show() {
    self.loadingView.play()
    UIView.animate(
      withDuration: 0.7,
      animations: { self.contentView.alpha = 1 }
    )
  }
  func hide(completion: @escaping () -> () = {}) {
    self.loadingView.stop()
    self.removeFromSuperview()
    completion()
  }
}
