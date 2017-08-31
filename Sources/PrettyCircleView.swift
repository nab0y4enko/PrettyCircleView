//
//  PrettyCircleView.swift
//  PrettyCircleView
//
//  Created by Oleksii Naboichenko on 5/15/17.
//  Copyright © 2017 Oleksii Naboichenko. All rights reserved.
//

import UIKit

// MARK: - PrettyCircleView
@IBDesignable open class PrettyCircleView: UIView {

    // MARK: - Public
    @IBInspectable open var contentBackgroundColor: UIColor? = nil {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable open var contentBorderWidth: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable open var contentBorderColor: UIColor = UIColor.clear {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable open var contentImage: UIImage? = nil {
        didSet {
            setNeedsDisplay()
        }
    }

    // MARK: - Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)

        updateBackgroundColor()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        updateBackgroundColor()
    }

    // MARK: - UIView
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()

        updateBackgroundColor()
    }

    open override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            print("Get current graphics context is failed")
            return
        }

        //Clear context
        context.clear(rect)

        //Fill background
        if let backgroundColor = backgroundColor, backgroundColor != .clear {
            context.setFillColor(backgroundColor.cgColor)
            context.fill(rect)
        }

        //Main calculations
        let contentCenter = CGPoint(x: rect.midX, y: rect.midY)
        let contentRadius = min(rect.size.width, rect.size.height) / 2.0
        let contentBorderRadius = contentRadius - contentBorderWidth / 2.0

        ///Draw content background
        if let contentBackgroundColor = contentBackgroundColor {
            context.setFillColor(contentBackgroundColor.cgColor)
            context.addArc(center: contentCenter, radius: contentRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: false)
            context.drawPath(using: .fill)
        }

        //Draw image
        if let contentImage = contentImage {
            let imageOrigin = CGPoint(x: contentCenter.x - contentImage.size.width / 2,
                                      y: contentCenter.y - contentImage.size.height / 2)
            UIBezierPath(arcCenter: contentCenter, radius: contentRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: false).addClip()
            contentImage.draw(at: imageOrigin)
        }

        ///Draw border line
        context.setStrokeColor(contentBorderColor.cgColor)
        context.setLineWidth(contentBorderWidth)
        context.addArc(center: contentCenter, radius: contentBorderRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: false)
        context.drawPath(using: .stroke)
    }

    // MARK: - Private Instance Methods
    private func updateBackgroundColor() {
        guard backgroundColor == nil else {
            return
        }

        backgroundColor = .clear
    }
}
