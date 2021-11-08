//
//  UIView + Extension.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/06/29.
//

import UIKit

import CDSKit

extension UIView: CDSCatchuSelector {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
    
    func setCornerRadius(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
    
    /// 각 TVC,CVC의 className을 String으로 가져올 수 있도록 연산 프로퍼티를 설정합니다. 이 값들은 나중에 Identifier에 잘 써먹을 수 있습니다  
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
    var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
