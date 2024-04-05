//
//  HomeHeaderView.swift
//  NetflixCloneMVVM
//
//  Created by Fazli Altun on 5.04.2024.
//

import UIKit

class HomeHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createHeaderUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createHeaderUI(){
        lazy var headerImageView = UIImageView()
        headerImageView.image = UIImage(named: "brba2")
        addSubview(headerImageView)
        headerImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.right.left.equalToSuperview()
            make.height.equalTo(screenHeight*0.35)
        }
        addGradient()
        lazy var startButton = UIButton()
        startButton.setTitle("Play", for: .normal)
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.white.cgColor
        startButton.layer.cornerRadius =  10
        addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(screenHeight*0.3)
            make.left.equalToSuperview().offset(screenWidth*0.2)
            make.width.equalTo(100)
        }
        lazy var downloadButton = UIButton()
        downloadButton.setTitle("Download", for: .normal)
        downloadButton.layer.borderWidth = 1
        downloadButton.layer.borderColor = UIColor.white.cgColor
        downloadButton.layer.cornerRadius =  10
        addSubview(downloadButton)
        downloadButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(screenHeight*0.3)
            make.right.equalToSuperview().offset(-screenWidth*0.2)
            make.width.equalTo(100)
        }
    }
    
    private func addGradient() {
        lazy var gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        layer.addSublayer(gradientLayer)
    }
}
