//
//  ImageViewController.swift
//  Cassini
//
//  Created by Andrea Visini on 22/07/18.
//  Copyright © 2018 Andrea Visini. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    var imageUrl: NSURL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    private func fetchImage() {
        // se ho l'url
        if let url = imageUrl {
            spinner.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async {
                // prendo i dati dell'url
                let contentsOfURL = NSData(contentsOf: url as URL)
                DispatchQueue.main.async {
                    // se l'url è uguale all'url che ho chiesto ..
                    if url == self.imageUrl {
                        if let imageData = contentsOfURL {
                            self.image = UIImage(data: imageData as Data)
                        }
                    } else {
                        print("Ignored required URL: \(url)")
                    }
                }
            }
        }
    }
    
    private var imageView = UIImageView()
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView?.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.05
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        //  imageUrl = NSURL(string: DemoURLs.tramonto)
        
        // Do any additional setup after loading the view.
    }
}
