//
//  ViewController.swift
//  Filterer
//
//  Created by Tony Toussaint on 4/18/16.
//  Copyright © 2016 Tony Toussaint. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var bottomMenu: UIView!
    @IBOutlet var filterBtn: UIButton!
    @IBOutlet var secondaryMenu: UIView!
    @IBOutlet var imageView: UIImageView!
    
    
    @IBAction func onshare(sender: AnyObject) {
        if imageView.image != nil {
        let activityController = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
        presentViewController(activityController, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "Error", message: "You must choose a photo first", preferredStyle: .Alert )
            alert.addAction(UIAlertAction(title: "Okay", style: .Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    func showCamera(){
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .Camera
        presentViewController(cameraPicker, animated: true, completion: nil)
    }
    
    func showAlbum(){
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .PhotoLibrary
        presentViewController(cameraPicker, animated: true, completion: nil)
    }
    
    @IBAction func onNewPhoto(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "New Photo", message: nil, preferredStyle: .ActionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { action in
            self.showCamera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Album", style: .Default, handler: { action in
            self.showAlbum()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.image = image
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func onFilter(sender: UIButton) {
        
        if sender.selected{
            hideSecondaryView()
            sender.selected = false
            
        }else{
            showSecondaryMenu()
            sender.selected = true
        }
        
    }
    
    func showSecondaryMenu(){
        view.addSubview(secondaryMenu)
       
        let bottomConstraint = secondaryMenu.bottomAnchor.constraintEqualToAnchor(bottomMenu.topAnchor)
        let leftConstraint = secondaryMenu.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
        let rightConstraint = secondaryMenu.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        let heightConstraint = secondaryMenu.heightAnchor.constraintEqualToConstant(44)
        
        NSLayoutConstraint.activateConstraints([bottomConstraint,leftConstraint,rightConstraint,heightConstraint])
        view.layoutIfNeeded()
        self.secondaryMenu.alpha = 0.0
        
        UIView.animateWithDuration(0.4){
            self.secondaryMenu.alpha = 1.0
        }
        
    }
    
    func hideSecondaryView(){
        
        self.secondaryMenu.alpha = 1.0
        UIView.animateWithDuration(0.4, animations: { 
            self.secondaryMenu.alpha = 0.0
            }) { (completed) in
                if completed == true{
                self.secondaryMenu.removeFromSuperview()
                }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondaryMenu.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

