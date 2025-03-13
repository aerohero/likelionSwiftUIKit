//
//  ViewController.swift
//  UIViewDemo
//
//  Created by Sean on 3/13/25.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 스택 뷰
        setupStackView()
        // 버튼
        setupButton()
        // 스위치
        setupSwitch()
        // 스테퍼
        setupStepper()
        // 슬라이더
        setupSlider()
    }
    
    func setupStackView() {
        let stackView = UIStackView()
        stackView.backgroundColor = .systemGray6
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // 레이블 생성
        let label1 = UILabel()
        label1.backgroundColor = .systemRed
        label1.text = "Label 1"
        
        let label2 = UILabel()
        label2.backgroundColor = .systemBlue
        label2.text = "Label 2"
        
        let label3 = UILabel()
        label3.backgroundColor = .systemGreen
        label3.text = "Label 3"
        
        // 레이블을 stackView에 추가
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(label3)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    // MARK: - 버튼 생성
    func setupButton() {
        let button = UIButton(type: .close)
        //        button.setTitle("Press Me", for: .normal)
        //        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        //        button.setTitleColor(.white, for: .normal)
        //        button.backgroundColor = .systemBlue
        //        button.layer.cornerRadius = 10
        //        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Button configuration 추가 (iOS 15 이상)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Press Me"
        button.configuration = configuration
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
        
//        NSLayoutConstraint.activate([
//            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        ])
//    }
    
    // MARK: - 스위치 생성
    // (스위치와 레이블을 수평 스택 뷰에 추가)
    func setupSwitch() {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "Switch"
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [label, switchControl])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - 스테퍼 생성
    func setupStepper() {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stepper)
        
        NSLayoutConstraint.activate([
            stepper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 350),
            stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - 슬라이더 생성
    func setupSlider() {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        
        NSLayoutConstraint.activate([
            slider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
