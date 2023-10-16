//
//  GradientSlider.swift
//  Sliders
//
//  Created by Eken Özlü on 4.10.2023.
//

import UIKit

extension UIView {
    var snapshot: UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        let capturedImage = renderer.image { context in
            layer.render(in: context.cgContext)
        }
        return capturedImage
    }
}

final class GradientSlider : UISlider {
    
    private let baseLayer = CALayer()
    private let minTrackLayer = CAGradientLayer()
    private var sliderValue : Float = 0 {
        didSet {
            
        }
    }
    private var firstColor = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1).cgColor
    private var secondColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
    
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setup()
    }
    
    private func setup() {
        self.minimumValue = 0
        self.maximumValue = 50
        clear()
        createBaseLayer()
        createThumbImageView()
        configureMinTrackLayer()
        addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
    }
    
    private func clear() {
        tintColor = .clear
        maximumTrackTintColor = .clear
        backgroundColor = .clear
        thumbTintColor = .clear
    }
    
    private func createBaseLayer() {
        baseLayer.borderWidth = 1
        baseLayer.borderColor = UIColor.lightGray.cgColor
        baseLayer.masksToBounds = true
        baseLayer.backgroundColor = UIColor.white.cgColor
        baseLayer.frame = CGRect(x: 0, y: frame.height / 4,
                                 width: frame.width, height: frame.height / 2)
        baseLayer.cornerRadius = baseLayer.frame.height / 2
        layer.insertSublayer(baseLayer, at: 0)
    }
    
    private func createThumbImageView() {
        let thumbSize = (3 * frame.height) / 4
        let thumbView = ThumbView(frame: .init(x: 0, y: 0,
                                               width: thumbSize, height: thumbSize))
        thumbView.layer.cornerRadius = thumbSize / 2
        let thumbSnapshot = thumbView.snapshot
        setThumbImage(thumbSnapshot, for: .normal)
        setThumbImage(thumbSnapshot, for: .highlighted)
        setThumbImage(thumbSnapshot, for: .application)
        setThumbImage(thumbSnapshot, for: .disabled)
        setThumbImage(thumbSnapshot, for: .focused)
        setThumbImage(thumbSnapshot, for: .reserved)
        setThumbImage(thumbSnapshot, for: .selected)
    }
    
    private func configureMinTrackLayer() {
        minTrackLayer.colors = [firstColor, secondColor]
        minTrackLayer.startPoint = CGPoint(x: 0, y: 0.5)
        minTrackLayer.endPoint = CGPoint(x: 1, y: 0.5)
        minTrackLayer.frame = CGRect(x: 0, y: frame.height / 4,
                                     width: 0, height: frame.height / 2)
        minTrackLayer.cornerRadius = minTrackLayer.frame.height / 2
        layer.insertSublayer(minTrackLayer, at: 1)
    }
    
    @objc private func valueChanged(_ sender: GradientSlider) {
        sliderValue = sender.value
        secondColor = UIColor(red: CGFloat(sliderValue) * (255/50),
                              green: 255 - CGFloat(sliderValue) * (255/50),
                              blue: 0/255, alpha: 1).cgColor
        configureMinTrackLayer()
        print("\(sliderValue) - \(CGFloat(sliderValue) * (255/50)) - \(255 - CGFloat(sliderValue) * (255/50))")
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        let thumbRectA = thumbRect(forBounds: bounds,
                                   trackRect: trackRect(forBounds: bounds),
                                   value: value)
        minTrackLayer.frame = .init(x: 0, y: frame.height / 4,
                                    width: thumbRectA.midX, height: frame.height / 2)
        CATransaction.commit()
    }
    
}

final class ThumbView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = UIColor(red: 183 / 255, green: 122 / 255, blue: 231 / 255, alpha: 1)
        let middleView = UIView(frame: .init(x: frame.midX - 6, y: frame.midY - 6,
                                             width: 12, height: 12))
        middleView.backgroundColor = .white
        middleView.layer.cornerRadius = 6
        addSubview(middleView)
    }
    
}
