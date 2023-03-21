//
//  ViewController.swift
//  ImageFromGallery
//
//  Created by Rajeev on 20/03/23.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet var imgView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addImagePress(_ sender: UIButton)
    {
        
        let ac = UIAlertController(title: "Select Image", message: "Select image from?", preferredStyle: .actionSheet)
        let cameraBtn = UIAlertAction(title: "Camera", style: .default){[weak self] (_) in
            self?.showImagePicker(Selectedsource: .camera)
        }
        let libraryBtn = UIAlertAction(title: "Library", style: .default){[weak self] (_) in
            self?.showImagePicker(Selectedsource: .photoLibrary)
            
        }
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel,handler: nil)
        ac.addAction(cameraBtn)
        ac.addAction(libraryBtn)
        ac.addAction(cancelBtn)
        self.present(ac,animated: true,completion: nil)
        
    }
    func showImagePicker(Selectedsource:UIImagePickerController.SourceType)
    {
        guard UIImagePickerController.isSourceTypeAvailable(Selectedsource)
                else
        {
            print("Selected souce not available")
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = Selectedsource
        imagePickerController.allowsEditing = false
        self.present(imagePickerController,animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage
        {
            imgView.image = selectedImage
        }
        else
        {
            print("Image not found")
        }
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

