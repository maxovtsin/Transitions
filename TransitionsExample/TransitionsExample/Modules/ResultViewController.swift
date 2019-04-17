//
//  ResultViewController.swift
//  TransitionsExample
//
//  Created by Max Ovtsin on 15/4/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

import UIKit
import Transitions

class ResultViewController: UIViewController {

    let labelDetail = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        labelDetail.text = "Result is Fetched"
        labelDetail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelDetail)

        labelDetail.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
            ).isActive = true
        labelDetail.centerYAnchor.constraint(
            equalTo: view.centerYAnchor
            ).isActive = true
    }
}
