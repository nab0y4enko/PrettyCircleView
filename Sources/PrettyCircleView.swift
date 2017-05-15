//
//  PrettyCircleView.swift
//  PrettyCircleView
//
//  Created by Oleksii Naboichenko on 5/15/17.
//  Copyright © 2017 Oleksii Naboichenko. All rights reserved.
//

import UIKit
import PrettyExtensionsKit

@IBDesignable
open class PrettyCircleView: UIView {
    
    // MARK: - Public
    @IBInspectable var contentBorderWidth: CGFloat = 0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable public var contentBorderColor: UIColor = UIColor.clear {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable public var contentImage: UIImage? = nil {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    // MARK: - Private Properties
    private lazy var contentLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        self.layer.addSublayer(layer)
        return layer
    }()
    
    private var contentRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2.0
    }
    
    private var contentCenter: CGPoint {
        return CGPoint(x: bounds.size.width / 2.0, y: bounds.size.height / 2.0)
    }
    
    // MARK: - UIView
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        layoutIfNeeded()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        updateContentLayer()
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        updateContentLayer()
    }
    
    // MARK: - Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setNeedsDisplay()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setNeedsDisplay()
    }
    
    // MARK: - Private Instance Methods
    private func updateContentLayer() {
        //Update size and set border
        contentLayer.frame = bounds
        contentLayer.fillColor = UIColor.clear.cgColor
        contentLayer.strokeColor = contentBorderColor.cgColor
        contentLayer.lineWidth = contentBorderWidth
        contentLayer.contents = contentImage?.prettySquared()?.cgImage

        //Create circle path
        let circleStartAngle: CGFloat = 0
        let circleEndAngle: CGFloat = CGFloat.pi * 2.0
        let circleRadius = contentBorderWidth > 0 ? contentRadius - contentBorderWidth / 2.0 : contentRadius
        let circlePath = UIBezierPath()
        circlePath.addArc(withCenter: contentCenter, radius: circleRadius, startAngle: circleStartAngle, endAngle: circleEndAngle, clockwise: true)
        contentLayer.path = circlePath.cgPath
        
        //Update mask
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = circlePath.cgPath
        contentLayer.mask = maskLayer
    }
}
