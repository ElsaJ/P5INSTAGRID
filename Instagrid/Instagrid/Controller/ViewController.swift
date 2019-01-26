//
//  ViewController.swift
//  Instagrid
//
//  Created by Elsa Jeannin on 01/11/2018.
//  Copyright © 2018 Elsa Jeannin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - outlets
    @IBOutlet private weak var imagesOrganizerView: ImagesOrganizerView!
    @IBOutlet private weak var squareButton: UIButton!
    @IBOutlet private weak var standardButton: UIButton!
    @IBOutlet private weak var reverseButton: UIButton!
    @IBOutlet private var swipeGestureRecognizer: UISwipeGestureRecognizer!
    var selectedButtonTag: Int?
    
    // MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonsImage()
        imagesOrganizerView.delegate = self
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        if newCollection.verticalSizeClass == .compact {
            self.swipeGestureRecognizer.direction = .left
        }  else {
            self.swipeGestureRecognizer.direction = .up
        }}
    
    // MARK: Actions
    @IBAction func swipeHandler(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            sendImageToActivityController() }
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
    
    // BONUS change background color of the main View
    
    @IBAction func didTapBlackButton(_ sender: UIButton) {
        imagesOrganizerView.backgroundColor = .black
    }
    
    @IBAction func didTapPurpleButton(_ sender: UIButton) {
        imagesOrganizerView.backgroundColor = .purple
    }
    
    @IBAction func didTapBrownButton(_ sender: UIButton) {
        imagesOrganizerView.backgroundColor = .brown
    }
    
    // MARK: private
    
    private func setButtonsImage() {
        standardButton.setImage(UIImage(named: "Selected"), for: .selected)
        reverseButton.setImage(UIImage(named: "Selected"), for: .selected)
        squareButton.setImage(UIImage(named: "Selected"), for: .selected)
    }
    
    private func sendImageToActivityController() {
        UIGraphicsBeginImageContext(imagesOrganizerView.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else
        { return }
        imagesOrganizerView.layer.render(in: context)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else
        { return }
        UIGraphicsEndImageContext()
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
}

// MARK: - Extensions
extension ViewController: ImagesOrganizerViewDelegate {
    func imagesOrganizerView(_view: ImagesOrganizerView, didTapButton tag: Int) {
       selectedButtonTag = tag
       print(tag)
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imagesOrganizerView.updateImages(image: image, tag: selectedButtonTag!) }
        dismiss(animated:true, completion: nil)
    }
}




