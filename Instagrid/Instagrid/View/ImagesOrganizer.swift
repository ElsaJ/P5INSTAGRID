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
            imageOne.frame = CGRect(x: 15, y: 16, width: imageOne.frame.size.width, height: imageOne.frame.size.height)
            imageTwo.frame = CGRect(x: 166, y: 16, width: imageTwo.frame.size.width, height: imageTwo.frame.size.height)
            imageThree.frame = CGRect(x: 15, y: 169, width: imageThree.frame.size.width, height: imageThree.frame.size.height)
            shapeOne.isHidden = false
            shapeTwo.isHidden = false
            shapeThree.isHidden = false
        case .reverse:
            imageOne.frame = CGRect(x: 15, y: 169, width: imageOne.frame.size.width, height: imageOne.frame.size.height)
            imageTwo.frame = CGRect(x: 166, y: 169, width: imageTwo.frame.size.width, height: imageTwo.frame.size.height)
            imageThree.frame = CGRect(x: 15, y: 16, width: imageThree.frame.size.width, height: imageThree.frame.size.height)
            shapeOne.isHidden = false
            shapeTwo.isHidden = false
            shapeThree.isHidden = false
        case .square:
            imageOne.frame = CGRect(x: 15, y: 16, width: imageOne.frame.size.width, height: imageOne.frame.size.height)
            imageTwo.frame = CGRect(x: 166, y: 16, width: imageTwo.frame.size.width, height: imageTwo.frame.size.height)
            imageThree.frame = CGRect(x: 15, y: 169, width: imageOne.frame.size.width, height: imageOne.frame.size.height)
            shapeOne.isHidden = false
            shapeTwo.isHidden = false
            shapeThree.isHidden = false
            
        }
    }
    
    internal func addSubview(_ view: ImagesOrganizer) {
        
    }
        

    
    @IBOutlet private var imageOne: UIView!
    @IBOutlet private var imageTwo: UIView!
    @IBOutlet private var imageThree: UIView!
    @IBOutlet private var shapeOne: UIButton!
    @IBOutlet private var shapeTwo: UIButton!
    @IBOutlet private var shapeThree: UIButton!
}
