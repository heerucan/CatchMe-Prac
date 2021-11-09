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
    
    weak var guideButtonDelegate: GuideButtonProtocol?
    weak var sendNameDelegate: SendNameProtocol?
    
    private let backView = UIView().then {
        $0.backgroundColor = CDSColor.secondaryBG
        $0.setCornerRadius(cornerRadius: 20,
                           maskedCorners: [.layerMinXMaxYCorner,
                                           .layerMaxXMaxYCorner])
    }
    
    let progressBar = ProgressBar()
    
    private let catchuView = UIView().then {
        $0.layer.cornerRadius = 87 / 2
        $0.selectedCatchuBG(color: 3) /// 나중에 서버 관련 level 같은 값으로 대체
    }
    
    private lazy var catchuImageView = UIImageView().then {
        $0.layer.cornerRadius = 69 / 2
        $0.selectedCatchu(color: 3, phase: 3) /// 나중에 서버 관련 level 같은 값으로 대체
    }
    
    public let nameLabel = CDSLabel(style: .catchu1).then {
        $0.text = "커피커피름름커피커피커피커피름름커피커피" /// 나중에 삭제할 예정
        $0.numberOfLines = 2
        $0.addCharacterSpacing(kernValue: -0.6, paragraphValue: 0)
    }
    
    private let nameView = UIView()
    
    private lazy var editButton = UIButton().then {
        $0.setImage(CDSIcon.btnProfileEdit, for: .normal)
        $0.addTarget(self, action: #selector(touchupEditButton(_:)), for: .touchUpInside)
    }
    
    private let lockStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 6
        $0.alignment = .center
    }
    
    private let lockImageView = UIImageView().then {
        $0.image = CDSIcon.icLock
    }
    
    private lazy var dateStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 2
        $0.alignment = .center
        $0.addArrangedSubview(dateLabel)
        $0.addArrangedSubview(untilLabel)
    }
    
    private let dateLabel = CDSLabel(style: .caption0).then {
        $0.text = "2021.05.01" /// 나중에 삭제할 예정
        $0.textColor = CDSColor.textQuaternary
    }
    
    private let untilLabel = CDSLabel(style: .caption1).then {
        $0.text = "부터"
        $0.textColor = CDSColor.textQuaternary
    }
    
    private lazy var writeButton = CDSPlainButton(type: .normal, size: .small).then {
        $0.text = "캐칭"
        $0.addTarget(self, action: #selector(touchupWriteButton(_:)), for: .touchUpInside)
    }
    
    private let lineTopView = UIView()
    private let lineLeftView = UIView()
    private let lineBottomView = UIView()
    private let lineRightView = UIView()
    
    private lazy var levelView = UIView().then {
        $0.addSubviews([levelNumLabel, levelLabel])
    }
    
    private let levelNumLabel = CDSLabel(style: .body1).then {
        $0.text = "1"
    }
    
    private let levelLabel = CDSLabel(style: .body6).then {
        $0.text = "캐츄레벨"
    }
    
    private lazy var totalView = UIView().then {
        $0.addSubviews([totalNumLabel, totalLabel])
    }
    
    private let totalNumLabel = CDSLabel(style: .body1).then {
        $0.text = "23"
    }
    
    private let totalLabel = CDSLabel(style: .body6).then {
        $0.text = "총 캐칭"
    }
    
    private lazy var valueView = UIView().then {
        $0.addSubviews([valueNumLabel, valueLabel, guideButton])
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
        sendNameData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Custom Methods
    
    private func configUI() {
        nameLabel.textAlignment = .center
        
        [lineTopView, lineBottomView,
         lineRightView, lineLeftView].forEach {
            $0.backgroundColor = CDSColor.mainSeparator
        }
        
        [lineRightView, lineLeftView].forEach {
            $0.layer.cornerRadius = 1
        }
        
        [levelLabel, totalLabel, valueLabel].forEach {
            $0.textColor = CDSColor.textTertiary
        }
    }
    
    private func setupAutoLayout() {
        contentView.addSubview(backView)
        backView.addSubviews([progressBar, catchuView,
                              nameView, editButton,
                              lockStackView, dateStackView,
                              writeButton,
                              lineTopView, lineBottomView,
                              lineLeftView,lineRightView,
                              levelView, totalView, valueView])
        catchuView.addSubview(catchuImageView)
        lockStackView.addArrangedSubview(lockImageView)
        lockStackView.addArrangedSubview(dateStackView)
        nameView.addSubview(nameLabel)
        
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        progressBar.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(1)
            make.centerX.equalToSuperview()
        }
        
        catchuView.snp.makeConstraints { make in
            make.center.equalTo(progressBar.snp.center)
            make.width.height.equalTo(87)
        }
        
        catchuImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(69)
        }
        
        nameView.snp.makeConstraints { make in
            make.top.equalTo(progressBar.snp.bottom).offset(8)
            make.width.equalTo(177)
            make.height.lessThanOrEqualTo(46)
            make.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalTo(nameView.snp.centerY)
        }
        
        editButton.snp.makeConstraints { make in
            make.bottom.equalTo(nameView.snp.bottom)
            make.leading.equalTo(nameView.snp.trailing).inset(3)
            make.width.height.equalTo(48)
        }
        
        lockStackView.snp.makeConstraints { make in
            make.top.equalTo(editButton.snp.bottom).offset(11)
            make.centerX.equalToSuperview()
        }
        
        writeButton.snp.makeConstraints { make in
            make.top.equalTo(lockStackView.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        // 구분선
        lineTopView.snp.makeConstraints { make in
            make.top.equalTo(writeButton.snp.bottom).offset(23)
        }
        
        lineBottomView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(27)
        }
        
        [lineTopView, lineBottomView].forEach {
            $0.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(31)
                make.height.equalTo(1)
            }
        }
        
        lineLeftView.snp.makeConstraints { make in
            make.top.equalTo(lineTopView.snp.bottom).offset(15.5)
            make.width.equalTo(2)
            make.height.equalTo(33)
            make.trailing.equalTo(totalView.snp.leading).offset(-20)
        }
        
        lineRightView.snp.makeConstraints { make in
            make.top.equalTo(lineTopView.snp.bottom).offset(15.5)
            make.width.equalTo(2)
            make.height.equalTo(33)
            make.leading.equalTo(totalView.snp.trailing).offset(20)
        }
        
        // 캐츄레벨
        levelView.snp.makeConstraints { make in
            make.top.equalTo(lineTopView.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(48)
            make.width.equalTo(64)
            make.height.equalTo(40)
        }
        
        levelNumLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-5)
            make.centerX.equalToSuperview()
        }
        
        levelLabel.snp.makeConstraints { make in
            make.top.equalTo(levelNumLabel.snp.bottom).offset(3)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        // 총 캐칭
        totalView.snp.makeConstraints { make in
            make.top.equalTo(lineTopView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(70)
            make.height.equalTo(40)
        }
        
        totalNumLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-5)
            make.centerX.equalToSuperview()
        }
        
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(totalNumLabel.snp.bottom).offset(3)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        // 캐치지수
        valueView.snp.makeConstraints { make in
            make.top.equalTo(lineTopView.snp.bottom).offset(15)
            make.trailing.equalToSuperview().inset(40)
            make.width.equalTo(71)
            make.height.equalTo(40)
        }
        
        valueNumLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-5)
            make.centerX.equalToSuperview()
        }
        
        valueLabel.snp.makeConstraints { make in
            make.top.equalTo(valueNumLabel.snp.bottom).offset(3)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(3)
        }
        
        guideButton.snp.makeConstraints { make in
            make.leading.equalTo(valueLabel.snp.trailing).inset(5)
            make.centerY.equalTo(valueLabel.snp.centerY)
        }
    }
    
    func sendNameData() {
        if let name = nameLabel.text {
            sendNameDelegate?.nameData(name: name)
        }
    }
    
    // MARK: - @objc
    
    @objc func touchupEditButton(_ sender: UIButton) {
        print("이름편집버튼")
    }
    
    @objc func touchupWriteButton(_ sender: UIButton) {
        print("글작성버튼")
    }
    
    @objc func touchupGuideButton(_ sender: UIButton) {
        guideButtonDelegate?.clickToOpenGuidePopup()
    }
}
