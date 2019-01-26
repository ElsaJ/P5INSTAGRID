//
//  ImagesOrganizer.swift
//  Instagrid
//
//  Created by Elsa Jeannin on 02/12/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import UIKit

/// protocol to instaure the delegation
protocol ImagesOrganizerViewDelegate: class {
    func imagesOrganizerView(_view: ImagesOrganizerView, didTapButton tag: Int)
}

/// class to organize images in the main view
class ImagesOrganizerView: UIView {
    weak var delegate: ImagesOrganizerViewDelegate?
    @IBOutlet private var firstLine: UIStackView!
    @IBOutlet private var secondLine: UIStackView!
    private let firstButton = UIButton()
    private let secondButton = UIButton()
    private let thirdButton = UIButton()
    private let fourthButton = UIButton()
   
    /// enum for the three different styles
    enum Style {
        case standard, reverse, square
    }
    
    /// observing style
    var style: Style = .standard {
        didSet {
            setStyle(style)
        }
    }
    
    /// main func to manage apparences
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setButtonsBackgroundColors()
        setShape()
        setActionForButtons()
    }
    
    /// action's func to recognize which button is tapped
    @IBAction func didTapButton(_tag: Int) {
        switch tag {
        case firstButton.tag: tag = 1
        case secondButton.tag: tag = 2
        case thirdButton.tag: tag = 3
        case fourthButton.tag: tag = 4
        default: break
        }
        delegate?.imagesOrganizerView(_view: self, didTapButton: tag)
    }
    
    
    /// func to update images on each button
    func updateImages(image: UIImage, tag: Int) {
         setButtonTags()
        if tag == 1 {
            firstButton.setImage(image, for: .normal)
        } else if tag == 2 {
            secondButton.setImage(image, for: .normal)
        } else if tag == 3 {
            thirdButton.setImage(image, for: .normal)
        } else if tag == 4 {
            fourthButton.setImage(image, for: .normal)
        }
    }
    
    private func setButtonTags() {
        firstButton.tag = 1
        secondButton.tag = 2
        thirdButton.tag = 3
        fourthButton.tag = 4
    }
    
    /// private func to manage the three different styles in the main view
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
    
    /// private func to set buttons background color
    private func setButtonsBackgroundColors() {
        firstButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        secondButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        thirdButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        fourthButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    /// private func to add shape on each button when is in normal mode
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
    
    /// private func to set action for each button
    private func setActionForButtons() {
        firstButton.addTarget(self, action: #selector(didTapButton(_tag:)), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(didTapButton(_tag:)), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(didTapButton(_tag:)), for: .touchUpInside)
        fourthButton.addTarget(self, action: #selector(didTapButton(_tag:)), for: .touchUpInside)
    }
}

