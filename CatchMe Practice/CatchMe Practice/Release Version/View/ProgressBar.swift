//
//  ProgressBar.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/11/05.
//

import UIKit

import CDSKit
import SnapKit
import Then

class ProgressBar: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        self.snp.makeConstraints { make in
            make.width.height.equalTo(103)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let viewCenter = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        let backPath = UIBezierPath(arcCenter: viewCenter,
                                    radius: 99 / 2,
                                    startAngle: -(0.5 * .pi),
                                    endAngle: (1.5 * .pi),
                                    clockwise: true)
        backPath.lineWidth = 3
        CDSColor.mainSeparator.set()
        backPath.stroke()
        
        let path = UIBezierPath()
        path.addArc(withCenter: viewCenter,
                    radius: 99 / 2,
                    startAngle: (1.5 * .pi),
                    endAngle: (7/6 * .pi),
                    clockwise: true)
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = CDSColor.orangePrimaryBG.cgColor
        layer.lineWidth = 3.0
        layer.lineJoin = .round
        layer.lineCap = .round
        self.layer.addSublayer(layer)
        
        let ani = CABasicAnimation(keyPath: "strokeEnd")
        ani.fromValue = 0
        ani.toValue = 1
        ani.duration = 1.0
        layer.add(ani, forKey: "strokeEnd")
    }
}
