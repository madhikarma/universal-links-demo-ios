//
//  RedViewController.swift
//  UniversalLinksDemoApp
//
//  Created by Shagun Madhikarmi on 23/04/2020.
//  Copyright © 2020 Shagun Madhikarmi. All rights reserved.
//

import UIKit

final class RedViewController: UIViewController {
    private let label = UILabel()
    private(set) var text: String!

    init(text: String) {
        super.init(nibName: nil, bundle: nil)
        self.text = text
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = UIView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
        ])
        label.text = text
    }
}
