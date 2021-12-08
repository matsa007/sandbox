//
//  ViewController.swift
//  MapRoutes
//
//  Created by Сергей Матвеенко on 08.12.2021.
//

import UIKit
import MapKit
import CoreLocation

let mapView:MKMapView = {
    let mapView = MKMapView()
    mapView.translatesAutoresizingMaskIntoConstraints = false
    return mapView
}()

let addAddressButton:UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "AddNewAddress"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}()

let createRouteButton:UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "CreateRoute"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}()

let resetButton:UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "Reset"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}()

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        addAddressButton.addTarget(self, action: #selector(addAddressButtonTapped), for: .touchUpInside)
        createRouteButton.addTarget(self, action: #selector(createRouteButtonTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func addAddressButtonTapped() {
        mapView.addSubview(createRouteButton)
        NSLayoutConstraint.activate([
        createRouteButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -20),
        createRouteButton.centerXAnchor.constraint(equalTo: mapView.centerXAnchor),
        createRouteButton.heightAnchor.constraint(equalToConstant: 50),
        createRouteButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        mapView.addSubview(resetButton)
        NSLayoutConstraint.activate([
        resetButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -20),
        resetButton.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 20),
        resetButton.heightAnchor.constraint(equalToConstant: 50),
        resetButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func createRouteButtonTapped() {
        
    }
    
    @objc func resetButtonTapped() {
        
    }
}

extension ViewController {

    func setConstraints() {
        
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
        mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
        mapView.addSubview(addAddressButton)
        NSLayoutConstraint.activate([
        addAddressButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -20),
        addAddressButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20),
        addAddressButton.heightAnchor.constraint(equalToConstant: 50),
        addAddressButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
