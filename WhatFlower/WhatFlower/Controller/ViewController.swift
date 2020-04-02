//
//  ViewController.swift
//  WhatFlower
//
//  Created by Matthew Musgrove on 3/31/20.
//  Copyright © 2020 Matthew Musgrove. All rights reserved.
//

import UIKit
import CoreML
import Vision
import SDWebImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    let imagePicker = UIImagePickerController()
    var flowerManager = FlowerManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        // imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        
        flowerManager.delegate = self
    }

    @IBAction func cameraTapped(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        if let userImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            imageView.image = userImage
            
            guard let ciImage = CIImage(image: userImage) else {
                fatalError("Could not convert to CI Image")
            }
            
            detect(image: ciImage)
            
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    func detect(image: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError("Loading CoreML Model failed.")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process image.")
            }
            
            if let firstResult = results.first{
                self.navigationItem.title = firstResult.identifier.capitalized
                self.flowerManager.requestInfo(flowerName: firstResult.identifier)
            }
            
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
        
    }
    
}

extension ViewController: FlowerManagerDelegate {
    
    func didFetchFlower(_ flowerManager: FlowerManager, _ flower: FlowerModel) {
        DispatchQueue.main.async {
            self.imageView.sd_setImage(with: URL(string: flower.imageURL))
            self.label.text = flower.description
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

