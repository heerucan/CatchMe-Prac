//
//  CharacterHeaderView.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/11/05.
//

import UIKit

import CDSKit
import SnapKit
import Then

class CharacterHeaderView: UIView {
    
    // MARK: - Properties
    let progressBar = ProgressBar().then {
        $0.backgroundColor = .clear
    }
    
    let catchuView = UIView().then {
        $0.layer.cornerRadius = 87 / 2
        $0.backgroundColor = .systemPink
    }
    
    let catchuImageView = UIImageView().then {
        $0.backgroundColor = .orange
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
        progressBar.frame = self.frame
        setCornerRadius(cornerRadius: 20, maskedCorners: [.layerMinXMaxYCorner,
                                                          .layerMaxXMaxYCorner])
    }
    
    private func setupAutoLayout() {
        addSubviews([progressBar, catchuView])
        catchuView.addSubview(catchuImageView)
        
        progressBar.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(53)
            make.centerX.equalToSuperview()
        }
        
        catchuView.snp.makeConstraints { make in
            make.centerX.equalTo(progressBar.snp.centerX)
            make.centerY.equalTo(progressBar.snp.centerY)
            make.width.height.equalTo(87)
        }
        
        catchuImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(69)
        }
    }
}
