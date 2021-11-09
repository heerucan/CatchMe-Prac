//
//  CharacterPostTVC.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/11/04.
//

import UIKit

import CDSKit
import SnapKit
import Then

class CharacterPostTVC: UITableViewCell, UITableViewRegisterable {
    
    static let identifier = "CharacterPostTVC"

    // MARK: - Properties
    
    private lazy var dateStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 0
        $0.alignment = .center
        $0.addArrangedSubview(dateLabel)
        $0.addArrangedSubview(weekLabel)
    }

    private let dateLabel = CDSLabel(style: .body4).then {
        $0.text = "29"
    }
    
    private let weekLabel = CDSLabel(style: .button1).then {
        $0.text = "화"
    }
    
    private lazy var moreButton = UIButton().then {
        $0.setImage(CDSIcon.btnMore, for: .normal)
        $0.addTarget(self, action: #selector(touchupMoreButton(_:)), for: .touchUpInside)
    }
    
    private lazy var postStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 12
        $0.alignment = .center
        $0.addArrangedSubview(postLabel)
        $0.addArrangedSubview(postImageView)
        $0.addArrangedSubview(timeLabel)
    }
    
    private let postLabel = CDSLabel(style: .button1).then {
        $0.text = "암벽을 올랐다. 뿌듯해따 -.- 암벽을 올랐다. 뿌듯해따 -.- 암벽을 올랐다. 뿌듯해따 -.- 암벽을올라랐다. 뿌듯해따 -.- 암벽을 올랐다. 뿌듯해따 -.이암벽을 올랐다. 뿌듯해따 -.- 암벽을 올랐다. 뿌듯해따 -.- 암벽을 올랐다. 뿌듯해따 -.- 암벽을이이랐다. 뿌듯해따 -.- 암벽을 올랐다. 뿌듯해따 -.- 암벽을 올랐다. 뿌듯해따 -.- 암벽을 올랐다. 뿌듯해따 -.-"
        $0.numberOfLines = 0
        $0.addCharacterSpacing(kernValue: -0.6, paragraphValue: 4)
    }
    
    private let postImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 13
        $0.backgroundColor = .mainPink
    }

    private let timeLabel = CDSLabel(style: .button1).then {
        $0.textColor = CDSColor.textQuaternary
        $0.text = "오후 5:11"
    }
    
    private let separator = UIView().then {
        $0.backgroundColor = CDSColor.mainSeparator
    }
    
    
    // MARK: - Initalizing
    
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
    
    func configUI() {
        backgroundColor = CDSColor.mainBG
    }

    func setupAutoLayout() {
        contentView.addSubviews([dateStackView, postStackView, moreButton, separator])
        
        dateStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.leading.equalToSuperview().inset(16)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(21)
            make.centerX.equalToSuperview()
        }
        
        weekLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(18)
            make.centerX.equalToSuperview()
        }
        
        moreButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.trailing.equalToSuperview()
        }
        
        postStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.leading.equalTo(dateStackView.snp.trailing).offset(18)
            make.trailing.equalToSuperview().inset(20)
        }
        
        postLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(26)
        }
        
        postImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(222)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(24)
        }
        
        separator.snp.makeConstraints { make in
            make.top.equalTo(postStackView.snp.bottom).offset(12)
            make.leading.equalTo(postStackView.snp.leading)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(6)
            make.height.equalTo(1.5)
        }
        
    }
    
    // MARK: - @objc
    @objc func touchupMoreButton(_ sender: UIButton) {
        print("더보기버튼")
    }

}
