//
//  ViewController.swift
//  Buttons
//
//  Created by Vadim Rufov on 5.9.2023.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var buttonOne = Button(with: "First Button")
    lazy var buttonTwo = Button(with: "Second Medium Button")
    lazy var buttonThree = Button(with: "Third")
    
    lazy var stackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.alignment = .center
        view.spacing = 16
        return view
    }()
    
    lazy var bottomSheet = {
        let vc = BottomSheetViewController()
        vc.modalPresentationStyle = .pageSheet
        let vcPresentationController = vc.sheetPresentationController
        vcPresentationController?.detents = [.large()]
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
        stackView.addArrangedSubview(buttonThree)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        buttonThree.addAction(UIAction { _ in
            self.present(self.bottomSheet, animated: true, completion: {
                self.buttonThree.tintColorDidChange()
            })
            self.buttonThree.tintColorDidChange()
        }, for: .touchUpInside)
    }
    
    func tintColorDidChange(){
        super.view.tintColorDidChange()
    }

}
