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
    
    private func setStyle(_style: Style) {
        switch style {
        case .standard:
            shapeOne.isHidden = false
            shapeTwo.isHidden = false
            shapeThree.isHidden = false
        case .reverse:
            shapeOne.isHidden = false
            shapeTwo.isHidden = false
            shapeThree.isHidden = false
        case .square:
            shapeOne.isHidden = false
            shapeTwo.isHidden = false
            shapeThree.isHidden = false
            
        }
    }
    
    @IBOutlet private var imageOne: UIView!
    @IBOutlet private var imageTwo: UIView!
    @IBOutlet private var imageThree: UIView!
    @IBOutlet private var shapeOne: UIButton!
    @IBOutlet private var shapeTwo: UIButton!
    @IBOutlet private var shapeThree: UIButton!
}
