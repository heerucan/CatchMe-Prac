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

class CharacterVC: UIViewController, GuideButtonDelegate {
    
    // MARK: - Properties
    
    private let naviBar = NavigationBar()
    
    private lazy var mainTV = UITableView().then {
        $0.backgroundColor = CDSColor.secondaryBG
        $0.separatorStyle = .none
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
        view.addSubviews([mainTV, naviBar])
        
        naviBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(94)
        }
        
        mainTV.snp.makeConstraints { make in
            make.top.equalTo(naviBar.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    internal func clickToOpenGuidePopup() {
        print("캐치지수 팝업 보여주기")
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
            return SectionHeader()
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            return 22
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
        if indexPath.section == 0 {
            return 330
        }
        return 30
    }
}

// MARK: - UITableViewDataSource

extension CharacterVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterProfileTVC.className, for: indexPath)
                    as? CharacterProfileTVC else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterPostTVC.className, for: indexPath)
                    as? CharacterPostTVC else { return UITableViewCell() }
            cell.backgroundColor = CDSColor.mainBG
            return cell
        }
    }
}


