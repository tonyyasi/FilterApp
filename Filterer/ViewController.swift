//
//  ViewController.swift
//  Filterer
//
//  Created by Tony Toussaint on 4/18/16.
//  Copyright © 2016 Tony Toussaint. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var Sec: SpringImageView!

    @IBOutlet var SIV: SpringImageView!
    @IBOutlet var bottomMenu: UIView!
    @IBOutlet var filterBtn: UIButton!
    @IBOutlet var secondaryMenu: UIView!
    @IBOutlet var imageView: UIImageView!
    
    var filter: CIFilter!
    let context = CIContext(options: nil)
    var extent: CGRect!
    var scaleFactor: CGFloat!
    var pickedImage: UIImage!
    var a: UIImage!
    
    
    
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
    @IBAction func onRedFilter(sender: UIButton) {
        
        if sender.selected{
             imageView.image = pickedImage
          
            
            sender.selected = false
            
        }else{
            
           // extent = CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height)
            filter = CIFilter(name: "CISepiaTone")
            let cimage = CIImage(image: imageView.image!)
            
           // filter?.setDefaults()
            filter?.setValue(cimage, forKey: kCIInputImageKey)
            let output = filter?.outputImage
            let a = UIImage(CGImage: context.createCGImage(output!, fromRect: (output?.extent)!))
            
           
            imageView.image = a
           
            sender.selected = true
        }

    }
    
    @IBAction func onPurpleFilter(sender: UIButton) {
        
        if sender.selected{
            imageView.image = pickedImage
            
            
            sender.selected = false
            
        }else{
            
            // extent = CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height)
            filter = CIFilter(name: "CIColorPosterize")
            let cimage = CIImage(image: imageView.image!)
            
            // filter?.setDefaults()
            filter?.setValue(cimage, forKey: kCIInputImageKey)
            let output = filter?.outputImage
            let a = UIImage(CGImage: context.createCGImage(output!, fromRect: (output?.extent)!))
            
            
            imageView.image = a
            
            sender.selected = true
        }
        
    }
    
    
    @IBAction func onGreenFilter(sender: UIButton) {
        
        if sender.selected{
            imageView.image = pickedImage
            
            
            sender.selected = false
            
        }else{
            
            // extent = CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height)
            filter = CIFilter(name: "CIColorInvert")
            let cimage = CIImage(image: imageView.image!)
            
            // filter?.setDefaults()
            filter?.setValue(cimage, forKey: kCIInputImageKey)
            let output = filter?.outputImage
             a = UIImage(CGImage: context.createCGImage(output!, fromRect: (output?.extent)!))
            
            
            imageView.image = a
            
            sender.selected = true
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
        pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        imageView.image = pickedImage
       
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    @IBAction func onCompare(sender: UIButton) {
        
        if imageView.image != nil && a != nil{
        
        if sender.selected{
            SIV.animation = "fadeInRight"
            SIV.force = 0.12
            
            SIV.animate()
            imageView.image = a
            
            
            sender.selected = false
            
        }else{
            
            SIV.animation = "fadeInLeft"
            SIV.force = 0.12
            SIV.animate()
            imageView.image = pickedImage
            
            sender.selected = true
            }
        }
        else {
            let alert = UIAlertController(title: "Error", message: "You must choose a photo first", preferredStyle: .Alert )
            alert.addAction(UIAlertAction(title: "Okay", style: .Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }

        
    }
    
    @IBAction func onYellowFilter(sender: UIButton) {
        
        if sender.selected{
            imageView.image = pickedImage
            
            
            sender.selected = false
            
        }else{
            
            // extent = CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height)
            filter = CIFilter(name: "CIPhotoEffectProcess")
            let cimage = CIImage(image: imageView.image!)
            
            // filter?.setDefaults()
            filter?.setValue(cimage, forKey: kCIInputImageKey)
            let output = filter?.outputImage
            a = UIImage(CGImage: context.createCGImage(output!, fromRect: (output?.extent)!))
            
            
            imageView.image = a
            
            sender.selected = true
        }
        

        
    }
    
    
    @IBAction func onBlueFilter(sender: UIButton) {
        
        if sender.selected{
            imageView.image = pickedImage
            
            
            sender.selected = false
            
        }else{
            
            // extent = CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height)
            filter = CIFilter(name: "CIPhotoEffectMono")
            let cimage = CIImage(image: imageView.image!)
            
            // filter?.setDefaults()
            filter?.setValue(cimage, forKey: kCIInputImageKey)
            let output = filter?.outputImage
            a = UIImage(CGImage: context.createCGImage(output!, fromRect: (output?.extent)!))
            
            
            imageView.image = a
            
            sender.selected = true
        }

        
    }
    
    
    @IBAction func onFilter(sender: UIButton) {
        if imageView.image != nil {
        
        if sender.selected{
            hideSecondaryView()
            sender.selected = false
            
        }else{
            showSecondaryMenu()
            sender.selected = true
        }
        }
        else {
            
            let alert = UIAlertController(title: "Error", message: "You must choose a photo first", preferredStyle: .Alert )
            alert.addAction(UIAlertAction(title: "Okay", style: .Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
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
       
      Sec.animation = "zoomIn"
        Sec.animate()
        
    }
    
    func hideSecondaryView(){
        
       
        UIView.animateWithDuration(0.4, animations: { 
            self.Sec.animation = "zoomOut"
            self.Sec.animate()
            }) { (completed) in
                if completed == true{
                   
                self.secondaryMenu.removeFromSuperview()
                }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondaryMenu.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.9)
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        // Do any additional setup after loading the view, typically from a nib.
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

