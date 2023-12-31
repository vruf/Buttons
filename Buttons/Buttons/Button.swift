//
//  Button.swift
//  Buttons
//
//  Created by Vadim Rufov on 5.9.2023.
//

import UIKit

class Button: UIButton {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(with text: String) {
        super.init(frame: .zero)
        configuration = UIButton.Configuration.filled()
        configuration?.title = text
        configuration?.imagePlacement = .trailing
        configuration?.image = UIImage(systemName: "arrow.right.circle")
        configuration?.buttonSize = .medium
        configuration?.imagePadding = 8
        configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        layer.cornerRadius = 8
        self.tintAdjustmentMode = .automatic
        
        addTarget(self, action: #selector(self.buttonPressed), for: .touchDown)
        addTarget(self, action: #selector(self.releaseButton), for: .touchUpInside)
        addTarget(self, action: #selector(self.releaseButton), for: .touchUpOutside)
        
        self.tintColorDidChange()
    }
    
    @objc func buttonPressed(button: UIButton) {
        UIView.animate(
            withDuration: 0.05,
            animations: {button.transform = button.transform.scaledBy(x: 0.90, y: 0.90)},
            completion: {_ in }
        )
    }
    
    @objc func releaseButton(button: UIButton) {
        UIView.animate(
            withDuration: 0.1,
            delay: .zero,
            options: [.allowUserInteraction],
            animations: {button.transform = CGAffineTransform.identity},
            completion: {_ in }
        )
    }
    
        override func tintColorDidChange() {
            super.tintColorDidChange()
            if self.tintAdjustmentMode == .dimmed {
                self.backgroundColor = UIColor.systemGray2
                self.setTitleColor(UIColor.systemGray3, for: .normal)
                
            } else {
                self.configuration?.baseBackgroundColor = UIColor.systemBlue
                self.configuration?.baseForegroundColor = UIColor.white
            }
        }
    
    
}
