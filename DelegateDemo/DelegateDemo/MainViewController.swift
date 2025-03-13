//
//  ViewController.swift
//  DelegateDemo
//
//  Created by Sean on 3/13/25.
//

import UIKit

class MainViewController: UIViewController, CustomViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
    }
    
    func setupButton() {
        let showCustomViewButton = UIButton(type: .system)
        showCustomViewButton.setTitle("커스텀 뷰 보기", for: .normal)
        // #selector 사용하지 않고 위한 대체 코드
        showCustomViewButton.addAction(UIAction { _ in
            self.showCustomView()
        }, for: .touchUpInside)
        showCustomViewButton.translatesAutoresizingMaskIntoConstraints = false
        // frame 아닌 autolayout으로 설정
        view.addSubview(showCustomViewButton)
        
        NSLayoutConstraint.activate([
            showCustomViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showCustomViewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        // 배열이므로 쉼표 누락 주의
    }
    
    private func showCustomView() {
        let customVC = CustomViewController()
        // 중요: 여기서 self를 델리게이트로 설정합니다
        customVC.delegate = self
        present(customVC, animated: true)
    }
    
    // MARK: - CustomViewControllerDelegate
    func didTapButton(withText text: String) {
        print("버튼이 탭되었습니다. 텍스트: \(text)")
    }
    
    func willAppear() {
        print("CustomViewController가 나타날 예정입니다.")
    }
}
