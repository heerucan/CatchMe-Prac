//
//  NavigationBar.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/11/05.
//

import UIKit

import CDSKit
import SnapKit
import Then

class NavigationBar: UIView {

    // MARK: - Properties
    let backButton = UIButton().then {
        $0.setImage(CDSIcon.btnBack, for: .normal)
    }
    
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.numberOfLines = 2
        $0.lineBreakMode = .byWordWrapping
        $0.text = "커피커피름름커피커피커피커피름름커피커피"
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Methods
    private func configUI() {
        backgroundColor = CDSColor.secondaryBG
    }
    
    private func setupAutoLayout() {
        addSubviews([backButton, nameLabel])
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(55)
            make.leading.equalToSuperview().inset(3)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(64)
            make.centerX.equalToSuperview()
            make.width.equalTo(123)
        }
    }
}
