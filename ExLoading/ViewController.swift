//
//  ViewController.swift
//  ExLoading
//
//  Created by 김종권 on 2022/05/22.
//

import UIKit

class ViewController: UIViewController {
  private let loadingButton: UIButton = {
    let button = UIButton()
    button.setTitle("loading", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    
    self.view.addSubview(self.loadingButton)
    NSLayoutConstraint.activate([
      self.loadingButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80),
      self.loadingButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
  }
  
  @objc private func didTapButton() {
    guard !self.view.subviews.contains(where: { $0 is MyLoadingView }) else { return }
    let loadingView = MyLoadingView()
    self.view.addSubview(loadingView)
    loadingView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    self.view.layoutIfNeeded()
    loadingView.show()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
      loadingView.hide {
        self.loadingButton.setTitle("로딩 종료!", for: .normal)
      }
    }
  }
}
