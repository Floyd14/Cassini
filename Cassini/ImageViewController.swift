//
//  ImageViewController.swift
//  Cassini
//
//  Created by Andrea Visini on 22/07/18.
//  Copyright © 2018 Andrea Visini. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    var imageUrl: NSURL? {
        didSet {
            image = nil
            fetchImage()
        }
    }
    
    private func fetchImage() {
        if let url = imageUrl {
            if let imageData = NSData(contentsOf: url as URL) {
                image = UIImage(data: imageData as Data)
            }
        }
    }
    
    private var imageView = UIImageView()
    
    @IBOutlet weak var scrollView: UIScrollView!
   
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        imageUrl = NSURL(string: DemoURLs.tramonto)
        
        // Do any additional setup after loading the view.
    }
}
