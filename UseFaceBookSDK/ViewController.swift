//
//  ViewController.swift
//  UseFaceBookSDK
//
//  Created by petar on 06.11.2023.
//

import UIKit

class ViewController: UIViewController {
    let myButton: UIButton = {
        var view = UIButton(type: .system)
        view.setTitle("hello", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        view.layer.borderWidth = 3.0
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 30
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.createAndApplyGradient(colors: [.red, .green], angle: 90)
        myButton.frame = CGRect(x: 0, y: 0, width: Int(view.bounds.width) - 64, height: 60)
        myButton.center = view.center
        myButton.createAndApplyGradient(colors: [.blue, .purple])
        myButton.clipsToBounds = true
        view.addSubview(myButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myButton.setNeedsDisplay()
    }
}

extension UIView {
    @discardableResult
    func createAndApplyGradient(colors: [UIColor],
                                angle: Double = 0) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.apply(angle: angle)
        gradientLayer.colors = colors.map { $0.cgColor }
        layer.insertSublayer(gradientLayer, at: 0)
        return gradientLayer
    }
}

extension CAGradientLayer {
    func apply(angle: Double) {
        let x: Double = angle / 360.0
        let a = pow(sinf(Float(2 * Double.pi * ((x + 0.75) / 2))), 2)
        let b = pow(sinf(Float(2 * Double.pi * ((x + 0.0) / 2))), 2)
        let c = pow(sinf(Float(2 * Double.pi * ((x + 0.25) / 2))), 2)
        let d = pow(sinf(Float(2 * Double.pi * ((x + 0.5) / 2))), 2)
        startPoint = CGPoint(x: CGFloat(a), y: CGFloat(b))
        endPoint = CGPoint(x: CGFloat(c), y: CGFloat(d))
    }
}
