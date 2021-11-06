//
//  SectionHeader.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/11/06.
//

import UIKit

import CDSKit
import SnapKit
import Then

class SectionHeader: UIView {
    
    // MARK: - Properties
    
    let cornerImageView = UIImageView().then {
        $0.image = UIImage(named: "roundRectangle")
    }
    
    // MARK: - Initalizing
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAutoLayout()
        backgroundColor = CDSColor.mainBG
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    func setupAutoLayout() {
        addSubview(cornerImageView)
        
        cornerImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}
