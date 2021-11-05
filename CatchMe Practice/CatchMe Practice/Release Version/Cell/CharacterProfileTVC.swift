//
//  CharacterProfileTVC.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/11/05.
//

import UIKit

import CDSKit
import SnapKit
import Then

class CharacterProfileTVC: UITableViewCell, UITableViewRegisterable {
    
    static let identifier = "CharacterProfileTVC"
    
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
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Custom Methods
    private func configUI() {
        backgroundColor = CDSColor.secondaryBG
        progressBar.frame = self.frame
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
