//
//  Separator.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/11/05.
//

import UIKit

import CDSKit
import SnapKit

class Separator: UIView {

    // MARK: - Enum

    public enum SeparatorType {
    case vertical
    case horizontal
        
        fileprivate var width: CGFloat {
            switch self {
            case .vertical:
                return 313
            case .horizontal:
                return 2
            }
        }
        
        fileprivate var height: CGFloat {
            switch self {
            case .vertical:
                return 1
            case .horizontal:
                return 33
            }
        }
    }
    
    // MARK: - Public Properties
    
    public var type: SeparatorType = .vertical {
        didSet { setSize() }
    }
    
    // MARK: - Initalizing
    
    public init(type: SeparatorType) {
        super.init(frame: .zero)
        configUI()
        self.type = type
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func configUI() {
        backgroundColor = CDSColor.mainSeparator
    }
    
    private func setSize() {
        self.snp.makeConstraints {
            $0.height.equalTo(type.height)
            $0.width.equalTo(type.width)
        }
    }
}
