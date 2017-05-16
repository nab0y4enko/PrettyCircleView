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
    @IBInspectable open var contentBackgroundColor: UIColor? = nil {
        didSet {
            updateLayers()
        }
    }
    
    @IBInspectable open var contentBorderWidth: CGFloat = 0 {
        didSet {
            updateLayers()
        }
    }
    
    @IBInspectable open var contentBorderColor: UIColor = UIColor.clear {
        didSet {
            updateLayers()
        }
    }
    
    @IBInspectable open var contentImage: UIImage? = nil {
        didSet {
            updateLayers()
        }
    }
    
    // MARK: - Private Properties
    private lazy var contentBackgroundLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        self.layer.addSublayer(layer)
        return layer
    }()
    
    private lazy var contentLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        self.layer.addSublayer(layer)
        return layer
    }()
    
    private var contentLayersRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2.0
    }
    
    private var contentLayersCenter: CGPoint {
        return CGPoint(x: bounds.size.width / 2.0, y: bounds.size.height / 2.0)
    }
    
    private var contentLayersSize: CGSize {
        let lowerSideSize = min(bounds.size.width, bounds.size.height)
        return CGSize(width: lowerSideSize, height: lowerSideSize)
    }
    
    private var contentLayersCirclePath: CGPath {
        let circleCenter = CGPoint(x: contentLayersRadius, y: contentLayersRadius)
        let circleStartAngle: CGFloat = 0
        let circleEndAngle: CGFloat = CGFloat.pi * 2.0
        let circleRadius = contentBorderWidth > 0 ? contentLayersRadius - contentBorderWidth / 2.0 : contentLayersRadius
       
        let circlePath = UIBezierPath()
        circlePath.addArc(withCenter: circleCenter, radius: circleRadius, startAngle: circleStartAngle, endAngle: circleEndAngle, clockwise: true)

        return circlePath.cgPath
    }

    private var contentLayersCircleMaskLayer: CAShapeLayer {
        let maskLayer = CAShapeLayer()
        maskLayer.frame = CGRect(origin: CGPoint.zero, size: contentLayersSize)
        maskLayer.path = contentLayersCirclePath
        return maskLayer
    }
    
    // MARK: - UIView
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        updateLayers()
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        updateLayers()
    }
    
    // MARK: - Private Instance Methods
    private func updateLayers() {
        updateContentBackgroundLayer()
        updateContentLayer()
    }
    
    private func updateContentBackgroundLayer() {
        contentBackgroundLayer.bounds = CGRect(origin: CGPoint.zero, size: contentLayersSize)
        contentBackgroundLayer.position = contentLayersCenter
        contentBackgroundLayer.fillColor = contentBackgroundColor?.cgColor
        contentBackgroundLayer.path = contentLayersCirclePath
        contentBackgroundLayer.mask = contentLayersCircleMaskLayer
    }
    
    private func updateContentLayer() {
        //Update size and content
        contentLayer.bounds = CGRect(origin: CGPoint.zero, size: contentLayersSize)
        contentLayer.position = contentLayersCenter
        contentLayer.fillColor = UIColor.clear.cgColor
        contentLayer.strokeColor = contentBorderColor.cgColor
        contentLayer.lineWidth = contentBorderWidth
        contentLayer.contents = contentImage?.prettySquared()?.cgImage
        contentLayer.path = contentLayersCirclePath
        contentLayer.mask = contentLayersCircleMaskLayer
    }
}
