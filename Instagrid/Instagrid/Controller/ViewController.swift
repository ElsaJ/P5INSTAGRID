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
    @IBOutlet weak var imagePicked: UIImageView!
    
    
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

extension ViewController: ImagesOrganizerViewDelegate {
    func firstButtonDidTap() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imagePicked.image = image
        dismiss(animated:true, completion: nil)
    }
}

