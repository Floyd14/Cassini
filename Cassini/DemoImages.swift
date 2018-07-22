//
//  DemoImages.swift
//  Cassini
//
//  Created by Andrea Visini on 22/07/18.
//  Copyright © 2018 Andrea Visini. All rights reserved.
//

import Foundation

struct DemoURLs {
    
    static let tramonto = "http://www.pixelcomunicazione.it/wp-content/uploads/2017/01/paes-46-17.jpg"
    
    static let NASA = [
        "Cassini" : "https://www.nasa.gov/sites/default/files/thumbnails/image/pia21923-nasa.jpg",
        "Earth" : "https://www.nasa.gov/sites/default/files/thumbnails/image/iss055e005471.jpg",
        "Saturn" : "https://www.nasa.gov/sites/default/files/thumbnails/image/pia12567-1600.jpg"
    ]
    
    static func NASAImageNamed(imageNamed: String?) -> NSURL? {
        if let urlString = NASA[imageNamed ?? ""] {
            return NSURL(string: urlString)
        } else {
            return nil
        }
    }
}
