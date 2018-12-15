//
//  ImagesOrganizer.swift
//  Instagrid
//
//  Created by Elsa Jeannin on 02/12/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import UIKit

class ImagesOrganizer: UIView {
    
    @IBOutlet private var firstLine: UIStackView!
    @IBOutlet private var secondLine: UIStackView!
    
    enum Style {
        case standard, reverse, square
    }
    
    var style: Style = .standard {
        didSet {
            setStyle(_style: style)
        }
    }
    
    let firstButton = UIButton()
    let secondButton = UIButton()
    let thirdButton = UIButton()
    let fourthButton = UIButton()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setBackgroundColors()
        setShape()
    }
    
    private func setStyle(_style: Style) {
        firstButton.removeFromSuperview()
        secondButton.removeFromSuperview()
        thirdButton.removeFromSuperview()
        fourthButton.removeFromSuperview()
       
        
        switch style {
        case .standard:
            firstLine.addArrangedSubview(firstButton)
            firstLine.addArrangedSubview(secondButton)
            secondLine.addArrangedSubview(thirdButton)
        case .reverse:
            firstLine.addArrangedSubview(thirdButton)
            secondLine.addArrangedSubview(firstButton)
            secondLine.addArrangedSubview(secondButton)
        case .square:
            firstLine.addArrangedSubview(firstButton)
            firstLine.addArrangedSubview(secondButton)
            secondLine.addArrangedSubview(thirdButton)
            secondLine.addArrangedSubview(fourthButton)
        }
    }
    
    private func setBackgroundColors() {
        firstButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        secondButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        thirdButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        fourthButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func setShape() {
        firstButton.setBackgroundImage(UIImage(named: "Combined Shape"), for: .normal)
        secondButton.setBackgroundImage(UIImage(named: "Combined Shape"), for: .normal)
        thirdButton.setBackgroundImage(UIImage(named: "Combined Shape"), for: .normal)
        fourthButton.setBackgroundImage(UIImage(named: "Combined Shape"), for: .normal)
        thirdButton.imageView?.contentMode = .topLeft
        firstButton.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
   
}
