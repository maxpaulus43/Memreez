//
//  FeedViewController.swift
//  Memreez
//
//  Created by Paulus, Max on 5/26/20.
//  Copyright © 2020 Macho. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var imageFeedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let items: [UIColor] = [
            .green,.black, .blue, .red
        ]
        let cell = UICollectionViewCell();
        cell.backgroundColor = items[indexPath.item % 4];
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
