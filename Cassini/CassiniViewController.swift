//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Andrea Visini on 22/07/18.
//  Copyright © 2018 Andrea Visini. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {
    
    private struct storyBoard {
        static let showImageSegue = "Show Detail"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == storyBoard.showImageSegue {
            if let ivc = segue.destination as? ImageViewController {
                let imageName = (sender as? UIButton)?.currentTitle
                ivc.imageUrl = DemoURLs.NASAImageNamed(imageNamed: imageName)
                ivc.title = imageName
            }
        }
        
    }
}
