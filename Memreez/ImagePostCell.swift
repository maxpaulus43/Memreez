//
//  ImagePostCell.swift
//  Memreez
//
//  Created by Paulus, Max on 5/29/20.
//  Copyright © 2020 Macho. All rights reserved.
//

import UIKit

class ImagePostCell: UITableViewCell {
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var captionLabel: UILabel!
    
    func setPost(post: Post) {
        self.photoImageView.image = post.photo
        self.captionLabel.text = post.caption
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 12, left: 12, bottom: 0, right: 12))
    }
}
