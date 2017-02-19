//
//  ViewController.swift
//  Doggo
//
//  Created by Neha Kunjal on 2/18/17.
//  Copyright © 2017 Neha Kunjal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var picViewer: UIImageView!
    let picViewerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        picViewerController.delegate = self;
        //let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.ImageTap))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func photoFromLibrary(_ sender: UIBarButtonItem) {
        picViewerController.allowsEditing = false
        picViewerController.sourceType = .photoLibrary
        picViewerController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picViewerController.modalPresentationStyle = .popover
        present(picViewerController, animated: true, completion: nil)
        picViewerController.popoverPresentationController?.barButtonItem = sender
    }
    
    @IBAction func shootPhoto(_ sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picViewerController.allowsEditing = false
            picViewerController.sourceType = UIImagePickerControllerSourceType.camera
            picViewerController.cameraCaptureMode = .photo
            picViewerController.modalPresentationStyle = .fullScreen
            present(picViewerController,animated: true,completion: nil)
        } else {
            noCamera()
        }
    }
    
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device is not connected to the camera. Check your preferences.",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let picker = info[UIImagePickerControllerOriginalImage] as? UIImage {
            picViewer.image = picker
        }
        dismiss(animated: true, completion:nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil )
    }
}
