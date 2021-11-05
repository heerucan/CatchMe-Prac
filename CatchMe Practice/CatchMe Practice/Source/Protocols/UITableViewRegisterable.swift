//
//  UITableViewRegisterable.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/11/05.
//

import UIKit

protocol UITableViewRegisterable {
    static func register(target: UITableView)
}

extension UITableViewRegisterable where Self: UITableViewCell {
    static func register(target: UITableView) {
        target.register(Self.self, forCellReuseIdentifier: Self.className)
    }
}
