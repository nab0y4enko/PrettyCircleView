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

    // MARK: - PrettyCircleViewImageContentMode
    public enum ImageContentMode {
        case center
        case aspectFit
        case aspectFill
    }

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

    open var imageContentMode: ImageContentMode = .center {
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
        super.draw(rect)

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
            //Clip image circle
            UIBezierPath(arcCenter: contentCenter, radius: contentRadius, startAngle: 0.0, endAngle: CGFloat(2.0 * Double.pi), clockwise: true).addClip()

            switch imageContentMode {
            case .center:
                let calculatedImageOrigin = CGPoint(x: contentCenter.x - contentImage.size.width / 2,
                                                    y: contentCenter.y - contentImage.size.height / 2)
                contentImage.draw(at: calculatedImageOrigin)
            case .aspectFit:
                let calculatedImageSize = sizeAspectFit(originalSize: contentImage.size, boundingSize: rect.size)
                let calculatedImageOrigin = CGPoint(x: rect.size.width / 2 - calculatedImageSize.width / 2,
                                                    y: rect.size.height / 2 - calculatedImageSize.height / 2)
                let calculatedImageRect = CGRect(origin: calculatedImageOrigin, size: calculatedImageSize)
                contentImage.draw(in: calculatedImageRect)
            case .aspectFill:
                let calculatedImageSize = sizeAspectFill(originalSize: contentImage.size, minimumSize: rect.size)
                let calculatedImageOrigin = CGPoint(x: rect.size.width / 2 - calculatedImageSize.width / 2,
                                                    y: rect.size.height / 2 - calculatedImageSize.height / 2)
                let calculatedImageRect = CGRect(origin: calculatedImageOrigin, size: calculatedImageSize)
                contentImage.draw(in: calculatedImageRect)
            }
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

    private func sizeAspectFit(originalSize: CGSize, boundingSize: CGSize) -> CGSize {
        guard originalSize.width != 0, originalSize.height != 0 else {
            return CGSize()
        }

        let aspectWidth = boundingSize.width / originalSize.width
        let aspectHeight = boundingSize.height / originalSize.height

        if aspectHeight < aspectWidth {
            return CGSize(width: aspectHeight * originalSize.width, height: boundingSize.height)
        } else if aspectHeight > aspectWidth {
            return CGSize(width: boundingSize.width, height: aspectWidth * originalSize.height)
        }

        return boundingSize
    }

    private func sizeAspectFill(originalSize: CGSize, minimumSize: CGSize) -> CGSize {
        guard originalSize.width != 0, originalSize.height != 0 else {
            return CGSize()
        }

        let aspectWidth = minimumSize.width / originalSize.width
        let aspectHeight = minimumSize.height / originalSize.height

        if aspectHeight > aspectWidth {
            return CGSize(width: aspectHeight * originalSize.width, height: minimumSize.height)
        } else if aspectHeight < aspectWidth {
            return CGSize(width: minimumSize.width, height: aspectWidth * originalSize.height)
        }
        
        return minimumSize
    }
}
