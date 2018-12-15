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
    
    let firstView = UIButton()
    let secondView = UIButton()
    let thirdView = UIButton()
    let fourthView = UIButton()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setBackgroundColors()
        setShape()
    }
    
    private func setStyle(_style: Style) {
        firstView.removeFromSuperview()
        secondView.removeFromSuperview()
        thirdView.removeFromSuperview()
        fourthView.removeFromSuperview()
       
        
        switch style {
        case .standard:
            firstLine.addArrangedSubview(firstView)
            firstLine.addArrangedSubview(secondView)
            secondLine.addArrangedSubview(thirdView)
        case .reverse:
             firstLine.addArrangedSubview(thirdView)
             secondLine.addArrangedSubview(firstView)
             secondLine.addArrangedSubview(secondView)
        case .square:
            firstLine.addArrangedSubview(firstView)
            firstLine.addArrangedSubview(secondView)
            secondLine.addArrangedSubview(thirdView)
            secondLine.addArrangedSubview(fourthView)
        }
    }
    
    private func setBackgroundColors() {
        firstView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        secondView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        thirdView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        fourthView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func setShape() {
        firstView.setBackgroundImage(UIImage(named: "Combined Shape"), for: .normal)
        firstView.imageView?.contentMode = .scaleAspectFit
        firstView.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
   
}
