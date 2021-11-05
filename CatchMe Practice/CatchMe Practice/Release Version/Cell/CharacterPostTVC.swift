//
//  CharacterPostTVC.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/11/04.
//

import UIKit

class CharacterPostTVC: UITableViewCell, UITableViewRegisterable {
    
    static let identifier = "CharacterPostTVC"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
