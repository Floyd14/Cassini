//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Andrea Visini on 22/07/18.
//  Copyright © 2018 Andrea Visini. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController, UISplitViewControllerDelegate {
    
    private struct storyBoard {
        static let showImageSegue = "Show Detail"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == storyBoard.showImageSegue {
            if let ivc = segue.destination.currentViewController as? ImageViewController {
                let imageName = (sender as? UIButton)?.currentTitle
                ivc.imageUrl = DemoURLs.NASAImageNamed(imageNamed: imageName)
                ivc.title = imageName
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setto il viewcontroller per essere il delegato a se stesso
        splitViewController?.delegate = self
    }
    
    
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController
        ) -> Bool
        {
            if primaryViewController == self {
                if let ivc = secondaryViewController.currentViewController as? ImageViewController, ivc.imageUrl == nil  {
                    return false
                }
            }
            return true
        }
    
}


extension UIViewController {
    var currentViewController: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
