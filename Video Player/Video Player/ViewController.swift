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

class ViewController: UIViewController {
    
    let url: NSURL = NSURL(fileURLWithPath: "gs://hackathon-go.appspot.com/JaggedKeyGalapagosalbatross.mp4")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        FIRApp.configure()
        
//        let storage = FIRStorage.storage()
//        let storageRef = storage.referenceForURL("gs://hackathon-go.appspot.com")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let playerVC = MobilePlayerViewController(contentURL: url)
        playerVC.title = "Vanilla Player - \(url)"
        playerVC.activityItems = [url] // Check the documentation for more information.
        presentMoviePlayerViewControllerAnimated(playerVC)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

