//
//  ViewController.swift
//  AnimationApp
//
//  Created by Сергей Матвеенко on 01.02.2022.
//

import UIKit


class ViewController: UIViewController {
    var animationRectangle = UIView()
    let animationButton = UIButton(type: .system)
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        animationRectangleSetup()
        animationButtonSetup()
    }
    
    func animationRectangleSetup() {
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
    
    func animationButtonSetup() {
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
}

extension ViewController {
    @objc func animationButtonTapped() {
        let viewRect = animationRectangle
        counter+=1
        
        //        MARK: - First action:
        
        if counter == 1 {
            
            UIView.animate(withDuration: 2.0, animations: {
                viewRect.transform = CGAffineTransform(translationX: -((self.view.frame.width/2)-viewRect.frame.width/2), y: -((self.view.frame.height/2)-viewRect.frame.height/2)).rotated(by: CGFloat.pi / 4)
            })
        }
        //        MARK: - Second action:
        
        if counter == 2 {
            UIView.animate(withDuration: 2.0, animations: {
                viewRect.transform = CGAffineTransform(translationX: ((self.view.frame.width/2)-viewRect.frame.width/2), y: -((self.view.frame.height/2)-viewRect.frame.height/2))
            })
        }
        //        MARK: - Third action:
        
        if counter == 3 {
            UIView.animate(withDuration: 2.0, animations: {
                viewRect.transform = CGAffineTransform(translationX: ((self.view.frame.width/2)-viewRect.frame.width/2), y: ((self.view.frame.height/2)-viewRect.frame.height/2)).rotated(by: CGFloat.pi / 4)
            })
        }
        //        MARK: - Fourth action:
        
        if counter == 4 {
            UIView.animate(withDuration: 2.0, animations: {
                viewRect.transform = CGAffineTransform(translationX: -((self.view.frame.width/2)-viewRect.frame.width/2), y: ((self.view.frame.height/2)-viewRect.frame.height/2))
            })
        }
        //        MARK: - Fifth action:
        
        if counter == 5 {
            UIView.animate(withDuration: 2.0, animations: {
                viewRect.transform = CGAffineTransform(rotationAngle: CGFloat(45.0 * .pi) / 180.0)
            },    completion: { (finished: Bool) in
                if finished {
                    viewRect.transform = .identity
                }    })
            counter = 0
        }
    }
}




