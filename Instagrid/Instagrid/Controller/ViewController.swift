//
//  ViewController.swift
//  Instagrid
//
//  Created by Elsa Jeannin on 01/11/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imagesOrganizerView: ImagesOrganizerView!
    @IBOutlet weak var squareButton: UIButton!
    @IBOutlet weak var standardButton: UIButton!
    @IBOutlet weak var reverseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonsImage()
        imagesOrganizerView.delegate = self
    }
    
    @IBAction func didTapStandardButton(_ sender: UIButton) {
        imagesOrganizerView.style = .standard
        standardButton.isSelected = true
        reverseButton.isSelected = false
        squareButton.isSelected = false
    }
    
    @IBAction func didTapReverseButton(_ sender: UIButton) {
        imagesOrganizerView.style = .reverse
        standardButton.isSelected = false
        reverseButton.isSelected = true
        squareButton.isSelected = false
    }
    
    @IBAction func didTapSquareButton(_ sender: UIButton) {
        imagesOrganizerView.style = .square
        standardButton.isSelected = false
        reverseButton.isSelected = false
        squareButton.isSelected = true
    }
    
    private func setButtonsImage() {
        standardButton.setImage(UIImage(named: "Selected"), for: .selected)
        reverseButton.setImage(UIImage(named: "Selected"), for: .selected)
        squareButton.setImage(UIImage(named: "Selected"), for: .selected)
    }
}

extension ViewController: ImagesOrganizerViewDelegate, UINavigationControllerDelegate {
    
    func shapeDidTap(_ sender: UIButton) {
        switch sender {
        case imagesOrganizerView.firstButton : imagesOrganizerView.firstButton.isSelected = true
        case imagesOrganizerView.secondButton: imagesOrganizerView.secondButton.isSelected = true
        case imagesOrganizerView.thirdButton: imagesOrganizerView.thirdButton.isSelected = true
        case imagesOrganizerView.fourthButton: imagesOrganizerView.fourthButton.isSelected = true
        default: break
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate {
        @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imagesOrganizerView.updateImages(image: image)
        dismiss(animated:true, completion: nil)
    }
}

