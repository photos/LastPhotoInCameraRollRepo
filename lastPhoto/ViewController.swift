//
//  ViewController.swift
//  lastPhoto
//
//  Created by Forrest Collins on 9/1/15.
//  Copyright (c) 2015 Forrest Collins. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {

    //-------------------
    // MARK: - UI Outlets
    //-------------------
    @IBOutlet weak var myImageView: UIImageView!
    
    //-------------------------------------
    // MARK: - Use Last Photo Button Tapped
    //-------------------------------------
    @IBAction func useLastPhotoButtonTapped(sender: UIBarButtonItem) {
        
        let fetchOptions: PHFetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        
        let fetchResult = PHAsset.fetchAssetsWithMediaType(PHAssetMediaType.Image, options: fetchOptions)
        
        // check result is not nil
        if (fetchResult.lastObject != nil) {
            
            let lastAsset: PHAsset = fetchResult.lastObject as! PHAsset
            
            PHImageManager.defaultManager().requestImageForAsset(lastAsset, targetSize: self.myImageView.bounds.size, contentMode: PHImageContentMode.AspectFill, options: PHImageRequestOptions(), resultHandler: { (result, info)in
                self.myImageView.image = result
            })
        }
    }
}

