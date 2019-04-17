//
//  DetailViewController.swift
//  Transitions
//
//  Created by Max Ovtsin on 27/3/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

import UIKit
import Transitions

class DetailViewController: UIViewController {

    private var injection: OpenDetailFlow.Injection

    var didPress: (() -> Void)?
    var didDeinit: (() -> Void)?

    let resultContentView = UIView()
    
    init(injection: OpenDetailFlow.Injection) {
        self.injection = injection
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        didDeinit?()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Detail"
        
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show Options", for: .normal)
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

        resultContentView.translatesAutoresizingMaskIntoConstraints = false
        resultContentView.backgroundColor = .white
        view.addSubview(resultContentView)
        resultContentView.heightAnchor.constraint(
            equalToConstant: 100
            ).isActive = true
        resultContentView.widthAnchor.constraint(
            equalToConstant: 300
            ).isActive = true
        resultContentView.bottomAnchor.constraint(
            equalTo: button.topAnchor,
            constant: -20
            ).isActive = true
        resultContentView.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
            ).isActive = true
    }
    
    @IBAction
    @objc
    func didPressButton(_ sender: UIButton) {
        didPress?()
    }
}
