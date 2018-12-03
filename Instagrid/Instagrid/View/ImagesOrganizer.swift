//
//  ImagesOrganizer.swift
//  Instagrid
//
//  Created by Elsa Jeannin on 02/12/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import UIKit

class ImagesOrganizer: UIView {
    
    enum Style {
        case standard, reverse, square
    }
    
    var style: Style = .standard {
        didSet {
            setStyle(_style: style)
        }
    }
    
    let firstView = UIView()
    let secondView = UIView()
    let thirdView = UIView()
    let fourthView = UIView()
    
    private func setStyle(_style: Style) {
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
        firstView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        secondView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        thirdView.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        fourthView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
    }
    
    @IBOutlet private var firstLine: UIStackView!
    @IBOutlet private var secondLine: UIStackView!
}
