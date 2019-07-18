//
//  ViewController.swift
//  Test
//
//  Created by Yuki Tokuhiro on 6/18/19.
//  Copyright © 2019 Yuki Tokuhiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let count: Int!
    
    required init(count: Int) {
        self.count = count
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.count = 0
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        let titleLabel = UILabel()
        titleLabel.text = String(count)
        view.addSubview(titleLabel)

        let button = UIButton(type: .infoDark)
        button.setTitle("Present", for: UIControl.State.selected)
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        view.addSubview(button)
        
        let dismissButton = UIButton(type: .infoLight)
        dismissButton.setTitle("Dismiss", for: .selected)
        dismissButton.addTarget(self, action: #selector(didTapDismiss), for: .touchUpInside)
        view.addSubview(dismissButton)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            dismissButton.topAnchor.constraint(equalTo: button.bottomAnchor),
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: dismissButton.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: dismissButton.centerXAnchor),
            ]
        )
    }

    @objc func didTap() {
        let v = ViewController(count: count + 1)
        present(v, animated: true, completion: nil)
    }
    
    @objc func didTapDismiss() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

}

