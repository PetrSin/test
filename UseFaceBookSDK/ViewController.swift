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
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        createGradientsBackground(firstColor: .green, secondColor: .red, gradientDirection: .vertically, forView: view)
        myButton.frame = CGRect(x: 0, y: 0, width: Int(view.bounds.width) - 64, height: 60)
        myButton.center = view.center
        createGradientsBackground(firstColor: .blue, secondColor: .purple, gradientDirection: .horizontally, forView: myButton)
        view.addSubview(myButton)
        
    }


}
enum Direction{
        case horizontally
        case vertically
    }

extension ViewController {
    
    func createGradientsBackground(firstColor: UIColor, secondColor: UIColor, gradientDirection: Direction, forView: AnyObject) {
        
        let gradientsLayer =  CAGradientLayer()
        gradientsLayer.frame = forView.bounds
        
        switch gradientDirection{
        case .horizontally:
            gradientsLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientsLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .vertically:
            gradientsLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientsLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        }
        
        gradientsLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        forView.layer.addSublayer(gradientsLayer)
    }
}
