//
//  ImagesOrganizer.swift
//  Instagrid
//
//  Created by Elsa Jeannin on 02/12/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import UIKit

protocol ImagesOrganizerViewDelegate: class {
    func shapeDidTap()
    func updateImages(image: UIImage)
}

class ImagesOrganizerView: UIView {
    
    @IBOutlet private var firstLine: UIStackView!
    @IBOutlet private var secondLine: UIStackView!
    weak var delegate: ImagesOrganizerViewDelegate?
    
    enum Style {
        case standard, reverse, square
    }
    
    var style: Style = .standard {
        didSet {
            setStyle(style)
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
        setActionForButtons()
    }
    
    @IBAction func shapeDidTap() {
        delegate?.shapeDidTap()
    }
    
    func updateImages(image: UIImage) {
        delegate?.updateImages(image: image)
        firstButton.setImage(image, for: .normal)
        secondButton.setImage(image, for: .normal)
        thirdButton.setImage(image, for: .normal)
        fourthButton.setImage(image, for: .normal)
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
