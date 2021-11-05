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
    let progressBar = ProgressBar()
    
    let catchuView = UIView().then {
        $0.layer.cornerRadius = 87 / 2
        $0.backgroundColor = CDSColor.orangePrimaryBG
    }
    
    let catchuImageView = UIImageView().then {
        $0.backgroundColor = .purple
        $0.layer.cornerRadius = 69 / 2
    }
    
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.text = "커피커피름름커피커피커피커피름름커피커피"
        $0.numberOfLines = 2
        $0.lineBreakMode = .byWordWrapping
    }
    
    let editButton = UIButton().then {
        $0.setImage(CDSIcon.btnProfileEdit, for: .normal)
    }
    
    let lineTopView = Separator()
    
    let levelStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 3
        $0.alignment = .center
    }
    
    let levelNumberLabel = UILabel().then {
        $0.text = "1"
    }
    
    let levelLabel = UILabel().then {
        $0.text = "레벨"
    }
    
    let separateLineLeftView = Separator()
    
    let activityStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 3
        $0.alignment = .center
    }
    
    let activityNumberLabel = UILabel().then {
        $0.text = "23"
    }
    
    let activityLabel = UILabel().then {
        $0.text = "캐칭"
    }
    
    let separateLineRightView = Separator()
    
    let catchNumberLabel = UILabel().then {
        $0.text = "50"
    }

    let catchLabel = UILabel().then {
        $0.text = "캐치지수"
    }
    
    let exclamationMarkImageView = UIImageView().then {
        $0.image = CDSIcon.btnGuide
    }
    
    let catchGuideButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    let lineBottomView = Separator()
    
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
    }
    
    private func setupAutoLayout() {
        addSubviews([progressBar, catchuView])
        catchuView.addSubview(catchuImageView)
        
        progressBar.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(1)
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
