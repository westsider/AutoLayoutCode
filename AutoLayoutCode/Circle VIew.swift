//
//  Circle VIew.swift
//  AutoLayoutCode
//
//  Created by Warren Hansen on 7/12/21.
//

import UIKit

class OnView: UIView {
    
    let size: CGFloat = 16
    let lineWidth: CGFloat = 2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // outer
        let outerBounds = CGRect(x: 0, y: 0, width: size, height: size).insetBy(dx: lineWidth/2, dy: lineWidth/2)

        context.setFillColor(UIColor.black.cgColor)
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(lineWidth)
        context.addEllipse(in: outerBounds)
        context.drawPath(using: .fillStroke)
        
        // inner
        let shrinkage: CGFloat = 0.6
        let innerBounds = CGRect(x: (size - size*shrinkage)/2,
                                 y: (size - size*shrinkage)/2,
                                 width: size*shrinkage,
                                 height: size*shrinkage)
        
        context.setFillColor(UIColor.black.cgColor)
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(lineWidth)
        context.addEllipse(in: innerBounds)
        context.drawPath(using: .fillStroke)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: size, height: size)
    }
}
