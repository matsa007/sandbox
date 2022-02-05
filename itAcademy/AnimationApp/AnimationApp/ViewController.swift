//
//  ViewController.swift
//  AnimationApp
//
//  Created by Сергей Матвеенко on 01.02.2022.
//

import UIKit

class ViewController: UIViewController {
    enum RectanglePosition: CaseIterable {
        case center
        case topLeftCorner
        case topRightCorner
        case bottomRightCorner
        case bottomLeftCorner
        
        func next() -> Self {
            let all = Self.allCases
            let idx = all.firstIndex(of: self)!
            let next = all.index(after: idx)
            return all[next == all.endIndex ? all.startIndex: next]
        }
    }
    private var animationRectangle = UIView()
    private let animationButton = UIButton(type: .system)
    private var rectanglePosition: RectanglePosition = .center
    private let toTheLeft = -1 , toTheRight = 1, toTheTop = -1, toTheBottom = 1, center = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        animationRectangleSetup()
        animationButtonSetup()
    }
    //    MARK: - VIEW setuping:
    
    private func animationRectangleSetup() {
        let viewR = animationRectangle
        viewR.translatesAutoresizingMaskIntoConstraints = false
        viewR.backgroundColor = UIColor(red: 0, green: 1, blue: 221/225, alpha: 1)
        view.addSubview(viewR)
        NSLayoutConstraint.activate([
            viewR.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewR.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewR.heightAnchor.constraint(equalToConstant: 50),
            viewR.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func animationButtonSetup() {
        let button = animationButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start Animation", for: .normal)
        button.setTitle("Animating process ...", for: .highlighted)
        button.backgroundColor = UIColor(red: 94/255, green: 0, blue: 1, alpha: 1)
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(animationButtonTapped), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80)
        ])
    }
    // MARK: - Animation logic
    
    private func direction(xDirection: Int, yDirection: Int, isRotation: Bool) {
        let x = ((self.view.frame.width/2) - (self.animationRectangle.frame.width/2)), y = ((self.view.frame.height/2) - (self.animationRectangle.frame.height/2))
        if isRotation {
            if xDirection == center && yDirection == center {
                UIView.animate(withDuration: 3.5, animations: {
                    self.animationRectangle.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
                }, completion: { (finished: Bool) in
                    self.animationRectangle.transform = CGAffineTransform(translationX: 0, y: 0)
                })
            } else {
                self.animationRectangle.transform = CGAffineTransform(translationX: x*CGFloat(xDirection), y: y*CGFloat(yDirection)).rotated(by: CGFloat.pi / 4)
            }
        } else {
            self.animationRectangle.transform = CGAffineTransform(translationX: x*CGFloat(xDirection), y: y*CGFloat(yDirection))
        }
    }
    
    private func animateToPosition(_ position: RectanglePosition) {
        UIView.animate(withDuration: 3.5) { [self] in
            switch position {
            case .topLeftCorner:
                direction(xDirection: toTheLeft, yDirection: toTheTop, isRotation: true)
            case .topRightCorner:
                direction(xDirection: toTheRight, yDirection: toTheTop, isRotation: false)
            case .bottomRightCorner:
                direction(xDirection: toTheRight, yDirection: toTheBottom, isRotation: true)
            case .bottomLeftCorner:
                direction(xDirection: toTheLeft, yDirection: toTheBottom, isRotation: false)
            case .center:
                direction(xDirection: center, yDirection: center, isRotation: true)
            }
        }
    }
}
//    MARK: - IBAction for button

extension ViewController {
    @objc private func animationButtonTapped() {
        rectanglePosition = rectanglePosition.next()
        animateToPosition(rectanglePosition)
    }
}
