//
//  ImagesOrganizer.swift
//  Instagrid
//
//  Created by Elsa Jeannin on 02/12/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import UIKit
import CoreImage

/// protocol to instaure the delegation
protocol ImagesOrganizerViewDelegate: class {
    func getImageForShape(_ index: Int)
}

/// class to organize images in the main view
class ImagesOrganizerView: UIView {
    
    @IBOutlet private var firstLine: UIStackView!
    @IBOutlet private var secondLine: UIStackView!
    weak var delegate: ImagesOrganizerViewDelegate?
    let firstButton = UIButton()
    let secondButton = UIButton()
    let thirdButton = UIButton()
    let fourthButton = UIButton()
    var firstButtonOgImage: UIImage?
    var position = 0
    
    /// enum for the three different styles
    enum Style {
        case standard, reverse, square
    }
    
    struct Filter {
        let filterName: String
        var filterEffectValue: Any?
        var filterEffectValueName: String?
        
        init(filterName: String, filterEffectValue: Any?, filterEffectValueName: String?) {
            self.filterName = filterName
            self.filterEffectValue = filterEffectValue
            self.filterEffectValueName = filterEffectValueName
        }
    }
    
    private func applyFilter(image: UIImage, filterEffect: Filter) -> UIImage? {
        guard let cgImage = image.cgImage,
            let openGLContext = EAGLContext(api: .openGLES3) else {
                return nil
        }

        let context = CIContext(eaglContext: openGLContext)
        let ciImage = CIImage(cgImage: cgImage)
        let filter = CIFilter(name: filterEffect.filterName)

        filter?.setValue(ciImage, forKey: kCIInputImageKey)

        if let filterEffectValue = filterEffect.filterEffectValue,
            let filterEffectValueName = filterEffect.filterEffectValueName {
            filter?.setValue(filterEffectValue, forKey: filterEffectValueName)
        }

        var filteredImage: UIImage?

        if let output = filter?.value(forKey: kCIOutputImageKey) as? CIImage,
            let cgiImageResult = context.createCGImage(output, from: output.extent) {
            filteredImage = UIImage(cgImage: cgiImageResult)
        }

        return filteredImage
    }
    
   func applyBlack() {
    guard let image = firstButtonOgImage else {
        return
    }
    
    firstButtonOgImage = applyFilter(image: image, filterEffect: Filter(filterName: "CIPhotoEffectNoir", filterEffectValue: nil, filterEffectValueName: nil))
    
    firstButton.setImage(image, for: .selected)
    }
    
    func applySepia() {

        guard let image = firstButtonOgImage else {
            return
        }
        firstButtonOgImage = applyFilter(image: image, filterEffect: Filter(filterName: "CISepiatone", filterEffectValue: 0.70, filterEffectValueName: kCIInputIntensityKey))
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
        setBackgroundColors()
        setShape()
        setActionForButtons()
    }
    
    /// action's func to recognize which button is tapped
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
    
    /// delegate func to retrieve images for each button
    func getImageForShape(_ index: Int) {
        position = index
        delegate?.getImageForShape(position)
    }
    
    /// func to update images on each button
    func updateImages(image: UIImage) {
        
        if position == 1 {
            firstButton.setImage(image, for: .selected)
            firstButtonOgImage = firstButton.image(for: .selected)
        } else if position == 2 {
            secondButton.setImage(image, for: .selected)
        } else if position == 3 {
            thirdButton.setImage(image, for: .selected)
        } else if position == 4 {
            fourthButton.setImage(image, for: .selected)
        }
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
    
    /// private func to set background color
    private func setBackgroundColors() {
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
        firstButton.addTarget(self, action: #selector(shapeDidTap), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(shapeDidTap), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(shapeDidTap), for: .touchUpInside)
        fourthButton.addTarget(self, action: #selector(shapeDidTap), for: .touchUpInside)
    }
}

