//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Sean on 3/24/25.
//

import UIKit

class ViewController: UIViewController {
  
  let animationView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureAnimationView()
    configureButton()
  }
  
  func configureAnimationView() {
    // 애니매이션을 적용할 뷰 설정
    animationView.frame = CGRect(x: 50, y: 100, width: 100, height: 100)
    animationView.backgroundColor = .systemBlue
    animationView.layer.cornerRadius = 8
    view.addSubview(animationView)
  }
  
  func configureButton() {
    let button = UIButton(type: .system)
    button.setTitle("Start Animation", for: .normal)
    
    button.addAction(UIAction(handler: { [weak self] _ in
      self?.startAnimation()
    }), for: .touchUpInside)
    
    button.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(button)
    
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: 20)
    ])
  }
  
  // 실습 1
//  func startAnimation() {
//    UIView.animate(withDuration: 1.0) {
//      self.animationView.frame.origin.x += 100
//      self.animationView.frame.origin.y += 50
//    }
//    self.animationView.layer.cornerRadius = 50
//  }
  
  // 실습 2
  func startAnimation() {
    UIView.animate(withDuration: 1, animations: {
      self.animationView.transform = self.animationView.transform.rotated(by: .pi / 4)
    }, completion: { _ in
      UIView.animate(withDuration: 1) {
        self.animationView.backgroundColor = .systemRed
      } completion: { _ in
        UIView.animate(withDuration: 1) {
          //          self.animationView.frame.origin.x += 100
          //          self.animationView.frame.origin.y += 50
        } completion: { _ in
          // 현재 상태에 따라 확대 또는 축소
          if self.animationView.transform == .identity {
            UIView.animate(withDuration: 1) {
              self.animationView.transform = CGAffineTransform(scaleX: 2, y: 2)
            }
          } else {
            UIView.animate(withDuration: 1.0) {
              self.animationView.transform = .identity
            }
          }
        }
      }
    })
//                   self.animationView.layer.cornerRadius = 50
  }
}

//#Preview {
//  ViewController()
//}
