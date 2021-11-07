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
    private lazy var backButton = UIButton().then {
        $0.setImage(CDSIcon.btnBack, for: .normal)
    }
    
    private lazy var nameView = UIView().then {
        $0.addSubview(nameLabel)
    }
    
    private let nameLabel = CDSLabel(style: .catchu3).then {
        $0.numberOfLines = 2
        $0.text = "커피커피름름커피커피커피커피름름커피커피"
        $0.addCharacterSpacing(kernValue: -0.6, paragraphValue: 0)
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
        nameLabel.textAlignment = .center
    }
    
    private func setupAutoLayout() {
        addSubviews([backButton, nameView])
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(55)
            make.leading.equalToSuperview().inset(3)
        }
        
        nameView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(64)
            make.centerX.equalToSuperview()
            make.width.equalTo(123)
            make.height.lessThanOrEqualTo(32)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalTo(nameView.snp.centerY)
        }
    }
}
