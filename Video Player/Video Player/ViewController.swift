//
//  ViewController.swift
//  Video Player
//
//  Created by Joseph Leiber on 7/29/16.
//  Copyright © 2016 Reduct Software. All rights reserved.
//

import UIKit
import MobilePlayer
//import Firebase
import FirebaseStorage


class ViewController: UIViewController {
    
    var storageRef : FIRStorageReference?
    var doc: NSURL?

    override func viewDidLoad() {
        super.viewDidLoad()

//        FIRApp.configure()
        
        let storage = FIRStorage.storage()
        storageRef = storage.referenceForURL("gs://hackathon-go.appspot.com/JaggedKeyGalapagosalbatross.mp4")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        download {

            let playerVC = MobilePlayerViewController(contentURL: self.doc!)
            playerVC.title = "Vanilla Player - \(self.doc)"
            playerVC.activityItems = [self.doc!]
            self.presentMoviePlayerViewControllerAnimated(playerVC)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func download(completion:()->()) {
        
        let doc = NSURL(fileURLWithPath:NSFileManager.cachesDir()).URLByAppendingPathComponent("testVideo.mp4")
        self.doc = doc
        
        // Download to the local filesystem
        storageRef?.writeToFile(doc) { (URL, error) in
            if (error != nil) {
                // Uh-oh, an error occurred!
                print(error)
            } else {
                // Local file URL for "images/island.jpg" is returned
                print(URL)
                completion()
            }
        }
    }


}

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


