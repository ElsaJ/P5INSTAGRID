//
//  ImagesOrganizer.swift
//  Instagrid
//
//  Created by Elsa Jeannin on 02/12/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import UIKit

protocol ImagesOrganizerViewDelegate: class {
    func getImageForShape(_ index: Int)
}

class ImagesOrganizerView: UIView {
    
    @IBOutlet private var firstLine: UIStackView!
    @IBOutlet private var secondLine: UIStackView!
    weak var delegate: ImagesOrganizerViewDelegate?
    let firstButton = UIButton()
    let secondButton = UIButton()
    let thirdButton = UIButton()
    let fourthButton = UIButton()
    var position = 0
    
    enum Style {
        case standard, reverse, square
    }
    
    var style: Style = .standard {
        didSet {
            setStyle(style)
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setBackgroundColors()
        setShape()
        setActionForButtons()
    }
    
    @IBAction func shapeDidTap(_ sender: UIButton) {
        switch sender {
        case firstButton: position = 1
        case secondButton: position = 2
        case thirdButton: position = 3
        case fourthButton: position = 4
        default: break
        }
        getImageForShape(position)
    }
    
    func getImageForShape(_ index: Int) {
        position = index
        delegate?.getImageForShape(position)
    }
    
    func updateImages(image: UIImage) {
    
        if position == 1 {
            firstButton.setImage(image, for: .selected)
        } else if position == 2 {
            secondButton.setImage(image, for: .selected)
        } else if position == 3 {
            thirdButton.setImage(image, for: .selected)
        } else if position == 4 {
            fourthButton.setImage(image, for: .selected)
        }
    }
    
    private func setStyle(_ style: Style) {
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
        firstButton.setImage(UIImage(named: "Combined Shape"), for: .normal)
        secondButton.setImage(UIImage(named: "Combined Shape"), for: .normal)
        thirdButton.setImage(UIImage(named: "Combined Shape"), for: .normal)
        fourthButton.setImage(UIImage(named: "Combined Shape"), for: .normal)
        firstButton.imageView?.contentMode = .scaleAspectFill
        secondButton.imageView?.contentMode = .scaleAspectFill
        thirdButton.imageView?.contentMode = .scaleAspectFill
        fourthButton.imageView?.contentMode = .scaleAspectFill
    }
    
    private func setActionForButtons() {
        firstButton.addTarget(self, action: #selector(shapeDidTap), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(shapeDidTap), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(shapeDidTap), for: .touchUpInside)
        fourthButton.addTarget(self, action: #selector(shapeDidTap), for: .touchUpInside)
    }
}

