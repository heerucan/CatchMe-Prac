//
//  DateHeader.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/11/06.
//

import UIKit

import CDSKit
import SnapKit
import Then

class DateHeader: UIView {
    
    // MARK: - Properties
    
    private lazy var backView = UIView().then {
        $0.layer.cornerRadius = 12
        $0.backgroundColor = CDSColor.secondaryBG
        $0.addSubview(dateLabel)
    }
    
    private let dateLabel = CDSLabel(style: .button1).then {
        $0.text = "2021년 12월" /// 나중에 삭제할 예정
        $0.addCharacterSpacing(kernValue: -0.6, paragraphValue: 0)
    }
        
    // MARK: - Initalizing
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAutoLayout()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    func configUI() {
        backgroundColor = CDSColor.mainBG
    }
    
    func setupAutoLayout() {
        addSubview(backView)
        
        backView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(3)
            make.leading.trailing.equalToSuperview().inset(10)
            make.center.equalToSuperview()
            make.height.equalTo(24)
        }
    }
}
