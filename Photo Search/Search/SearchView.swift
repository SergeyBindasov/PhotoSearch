//
//  SearchView.swift
//  Photo Search
//
//  Created by Sergey on 24.02.2021.
//

import UIKit

final class SearchView: UIView {
    
    var searchButtontapped: (() -> Void)?
    
    private lazy var searchLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Photo Search"
        lable.font = UIFont(name: "PingFangTC-Medium", size: 36)
        return lable
    }()
    
    private lazy var line: UIImageView = {
        let line = UIImageView()
        line.image = UIImage(named: "line2")
        line.clipsToBounds = true
        line.contentMode = .scaleAspectFill
        return line
    }()
    
    lazy var textField: UITextField = {
        let textfield = UITextField()
        textfield.layer.borderWidth = 1.5
        textfield.layer.cornerRadius = 10
        textfield.layer.borderColor = UIColor.darkGray.cgColor
        textfield.font = UIFont(name: "PingFangTC-Light", size: 16)
        textfield.placeholder = "Looking 4 something?"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        return textfield
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Search!", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        addSubviews(searchLabel, line, textField, button)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchView {
    @objc func buttonTapped() {
        searchButtontapped?()
    }
}

extension SearchView {
    func setupLayout() {
        let constraints = [
            searchLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 56),
            searchLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 28),
            line.topAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: -15),
            line.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            line.widthAnchor.constraint(equalToConstant: 280),
            line.heightAnchor.constraint(equalToConstant: 40),
            textField.widthAnchor.constraint(equalToConstant: 300),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.centerXAnchor.constraint(equalTo: centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.widthAnchor.constraint(equalToConstant: 180),
            button.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
