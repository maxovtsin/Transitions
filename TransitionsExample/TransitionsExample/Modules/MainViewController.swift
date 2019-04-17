//
//  MainViewController.swift
//  Transitions
//
//  Created by Max Ovtsin on 27/3/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var didPressDetails: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Main"

        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open Detail", for: .normal)
        button.addTarget(
            self,
            action: #selector(didPressButton(_:)),
            for: .touchUpInside
        )
        view.addSubview(button)
        
        button.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
            ).isActive = true
        button.centerYAnchor.constraint(
            equalTo: view.centerYAnchor
            ).isActive = true
    }

    @IBAction
    @objc
    func didPressButton(_ sender: UIButton) {
        didPressDetails?()
    }
}
