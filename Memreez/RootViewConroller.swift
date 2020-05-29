//
//  FeedViewController.swift
//  Memreez
//
//  Created by Paulus, Max on 5/26/20.
//  Copyright © 2020 Macho. All rights reserved.
//

import UIKit
import MobileCoreServices

class RootViewConroller: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imagePickerButton: UIButton!
    var feedVC: FeedViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func choosePictureButtonTapped(_ sender: UIButton) {
        showImagePickerOptions()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "RootFeedSegue") {
            self.feedVC = (segue.destination as! FeedViewController)
        }
    }
    
    func showImagePickerOptions() {
        let imagePickerOptions = UIAlertController(title: "Upload photo/video", message: nil, preferredStyle: .actionSheet)
        imagePickerOptions.addAction(UIAlertAction(title: "Pick from album", style: .default, handler: { (action) in
            if (UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)) {
                self.showImagePicker(sourceType: .savedPhotosAlbum)
            }
        }))
        imagePickerOptions.addAction(UIAlertAction(title: "Take photo", style: .default, handler: { (action) in
            if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
                self.showImagePicker(sourceType: .camera)
            }
        }))
        imagePickerOptions.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            self.dismiss(animated: true)
        }))
        present(imagePickerOptions, animated: true)
    }
    
    func showImagePicker(sourceType: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        
        let availableMediaTypes = UIImagePickerController.availableMediaTypes(for: sourceType) ?? []
        if (availableMediaTypes.contains(kUTTypeMovie as String)) {
            picker.mediaTypes.append(kUTTypeMovie as String)
        }
        
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = sourceType
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.editedImage] as? UIImage {
            self.feedVC?.addPost(post: Post(photo: image, caption: "My Awesome caption"))
        } else if let video = info[.editedImage] as? Any {
            print(video) // todo do something with videos!
        }
        
        dismiss(animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
