//
//  ViewController.swift
//  Instagrid
//
//  Created by Elsa Jeannin on 01/11/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagesOrganizer: ImagesOrganizer!
    @IBOutlet weak var squareButton: UIButton!
    @IBOutlet weak var standardButton: UIButton!
    @IBOutlet weak var reverseButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func didTapStandardButton(_ sender: UIButton) {
        imagesOrganizer.style = .standard
        standardButton.setImage(UIImage(named: "Selected"), for: .selected)
        
    }
    
    @IBAction func didTapReverseButton(_ sender: UIButton) {
       imagesOrganizer.style = .reverse
       reverseButton.setImage(UIImage(named: "Selected"), for: .selected)
    }
    
    @IBAction func didTapSquareButton(_ sender: UIButton) {
        imagesOrganizer.style = .square
        squareButton.setImage(UIImage(named: "Selected"), for: .selected)
    }
    
    private func setSelectedImage() {
        
    }
    
}

