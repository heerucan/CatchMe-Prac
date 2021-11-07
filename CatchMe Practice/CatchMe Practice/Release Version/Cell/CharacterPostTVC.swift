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
        
    }
    
    // MARK: - @objc


}
