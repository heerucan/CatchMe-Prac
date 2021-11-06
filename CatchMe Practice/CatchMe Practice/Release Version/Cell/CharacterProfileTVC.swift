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

protocol GuideButtonDelegate: AnyObject {
    func clickToOpenGuidePopup()
}

class CharacterProfileTVC: UITableViewCell, UITableViewRegisterable {
    
    static let identifier = "CharacterProfileTVC"
    
    // MARK: - Properties
    
    weak var delegate: GuideButtonDelegate?
    
    let progressBar = ProgressBar()
    
    private let catchuView = UIView().then {
        $0.layer.cornerRadius = 87 / 2
        $0.backgroundColor = CDSColor.orangePrimaryBG
    }
    
    private let catchuImageView = UIImageView().then {
        $0.backgroundColor = .purple
        $0.layer.cornerRadius = 69 / 2
    }
    
    private let nameLabel = CDSLabel(style: .catchu3).then {
        $0.text = "커피커피름름커피커피커피커피름름커피커피"
        $0.numberOfLines = 2
        $0.lineBreakMode = .byWordWrapping
    }
    
    private lazy var editButton = UIButton().then {
        $0.setImage(CDSIcon.btnProfileEdit, for: .normal)
    }
    
    private let lockStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 0
        $0.alignment = .center
    }
    

    
    private let lineTopView = Separator(type: .horizontal)
    private let lineLeftView = Separator(type: .vertical)
    private let lineBottomView = Separator(type: .horizontal)
    private let lineRightView = Separator(type: .vertical)

    private let levelStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 3
        $0.alignment = .center
    }
    
    private let levelNumLabel = CDSLabel(style: .body1).then {
        $0.text = "1"
    }
    
    private let levelLabel = CDSLabel(style: .body6).then {
        $0.text = "캐츄레벨"
    }
    
    private let totalStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 3
        $0.alignment = .center
    }
    
    private let totalNumLabel = CDSLabel(style: .body1).then {
        $0.text = "23"
    }
    
    private let totalLabel = CDSLabel(style: .body6).then {
        $0.text = "총 캐칭"
    }
    
    private let valueNumLabel = CDSLabel(style: .body1).then {
        $0.text = "50"
    }

    private let valueLabel = CDSLabel(style: .body6).then {
        $0.text = "캐치지수"
    }
    
    private lazy var guideButton = UIButton().then {
        $0.setImage(CDSIcon.btnGuide, for: .normal)
        $0.addTarget(self, action: #selector(touchupGuideButton(_:)), for: .touchUpInside)
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
    
    private func configUI() {
        backgroundColor = CDSColor.secondaryBG
    }
    
    private func setupAutoLayout() {
        contentView.addSubviews([progressBar, catchuView, catchuImageView])
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
    
    // MARK: - @objc
    
    @objc func touchupGuideButton(_ sender: UIButton) {
        delegate?.clickToOpenGuidePopup()
    }
}
