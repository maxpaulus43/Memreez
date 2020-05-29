//
//  FeedViewController.swift
//  Memreez
//
//  Created by Paulus, Max on 5/29/20.
//  Copyright © 2020 Macho. All rights reserved.
//

import UIKit

class FeedViewController: UITableViewController {
    var posts: [Post] = []
    
    func addPost(post: Post) {
        self.posts.append(post)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImagePostCell") as! ImagePostCell
        cell.setPost(post: post)
        return cell
    }
}
