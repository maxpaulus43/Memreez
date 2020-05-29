//
//  post.swift
//  Memreez
//
//  Created by Paulus, Max on 5/29/20.
//  Copyright © 2020 Macho. All rights reserved.
//

import Foundation
import UIKit

class Post {
    let photo: UIImage!
    let caption: String!
    
    init(photo: UIImage, caption: String) {
        self.photo = photo
        self.caption = caption
    }
}
