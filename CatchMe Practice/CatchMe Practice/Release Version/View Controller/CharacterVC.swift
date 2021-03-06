//
//  CharacterVC.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/09/04.
//

import UIKit

import CDSKit
import SnapKit
import Then

class CharacterVC: UIViewController, GuideButtonProtocol, SendNameProtocol {
    
    // MARK: - Properties
            
    private let naviBar = NavigationBar()
    
    private let bottomOfNaviBar = UIImageView().then {
        $0.image = UIImage(named: "roundRectangle")
    }
    
    private lazy var mainTV = UITableView(frame: .zero, style: .grouped).then {
        $0.backgroundColor = CDSColor.secondaryBG
        $0.separatorStyle = .none
        $0.allowsSelection = false
        $0.delegate = self
        $0.dataSource = self
        CharacterProfileTVC.register(target: $0)
        CharacterPostTVC.register(target: $0)
        if #available(iOS 15, *) {
            $0.sectionHeaderTopPadding = 0
        }
    }
    
    private let guideImageView = UIImageView().then {
        $0.image = UIImage(named: "imgCatchGuide")
        $0.isHidden = true
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupAutoLayout()
    }
    
    // MARK: - Custom Method
    
    private func configUI() {
        view.backgroundColor = CDSColor.mainBG
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupAutoLayout() {
        view.addSubviews([mainTV, bottomOfNaviBar, naviBar])
        
        naviBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(94)
        }
        
        bottomOfNaviBar.snp.makeConstraints { make in
            make.top.equalTo(naviBar.snp.bottom).offset(-2)
            make.leading.trailing.equalToSuperview()
        }
        
        mainTV.snp.makeConstraints { make in
            make.top.equalTo(naviBar.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    internal func clickToOpenGuidePopup() {
        print("캐치지수 팝업 보여주기")
        guideImageView.isHidden = false
    }
    
    func nameData(name: String) {
        self.naviBar.nameLabel.text = name
    }
}

// MARK: - UITableViewDelegate

extension CharacterVC: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1:
            return DateHeader()
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            return 54
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 352
        default:
            return UITableView.automaticDimension
        }
    }
    
    // MARK: - Navigation Animation
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 330 {
            UIView.animate(withDuration: 0.5, delay: .nan, options: .curveEaseIn) {
                self.naviBar.nameView.alpha = 1
                self.bottomOfNaviBar.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.1, delay: .nan, options: .curveEaseIn) {
                self.naviBar.nameView.alpha = 0
                self.bottomOfNaviBar.isHidden = true
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension CharacterVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterProfileTVC.className, for: indexPath)
                    as? CharacterProfileTVC else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.guideButtonDelegate = self
            cell.sendNameDelegate = self
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterPostTVC.className, for: indexPath)
                    as? CharacterPostTVC else { return UITableViewCell() }
            return cell
        }
    }
}


