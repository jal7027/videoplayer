//
//  ViewController.swift
//  Video Player
//
//  Created by Joseph Leiber on 7/29/16.
//  Copyright © 2016 Reduct Software. All rights reserved.
//

import UIKit
import MobilePlayer
import Firebase
import FirebaseStorage

extension NSFileManager {
    class func documentsDir() -> String {
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as [String]
        return paths[0]
    }
    
    class func cachesDir() -> String {
        var paths = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true) as [String]
        return paths[0]
    }
}

class ViewController: UIViewController {
    
//    let url: NSURL = NSURL(fileURLWithPath: "gs://hackathon-go.appspot.com/JaggedKeyGalapagosalbatross.mp4")
    
    var storageRef : FIRStorageReference?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        FIRApp.configure()
        
        let storage = FIRStorage.storage()
        storageRef = storage.referenceForURL("gs://hackathon-go.appspot.com/JaggedKeyGalapagosalbatross.mp4")
//        storageRef = storage.referenceForURL("gs://hackathon-go.appspot.com")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        /*
        let playerVC = MobilePlayerViewController(contentURL: url)
        playerVC.title = "Vanilla Player - \(url)"
        playerVC.activityItems = [url] // Check the documentation for more information.
//        presentMoviePlayerViewControllerAnimated(playerVC)
         */
        download()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    
    func download() {
        // Create a reference to the file you want to download
//        let islandRef = storageRef.child("images/island.jpg")
//        // Create local filesystem URL
//        let localURL: NSURL! = NSURL(string: "file:///local/images/island.jpg")
        
        let doc = NSURL(fileURLWithPath:NSFileManager.cachesDir()).URLByAppendingPathComponent("testVideo.mp4")
        
        // Download to the local filesystem
        storageRef?.writeToFile(doc) { (URL, error) in
            if (error != nil) {
                // Uh-oh, an error occurred!
                print(error)
            } else {
                // Local file URL for "images/island.jpg" is returned
                print(URL)
            }
        }
    }


}

