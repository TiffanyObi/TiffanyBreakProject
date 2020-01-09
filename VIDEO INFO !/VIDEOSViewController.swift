//
//  VIDEOSViewController.swift
//  TiffanyBreakProject
//
//  Created by Tiffany Obi on 12/27/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit
import SafariServices

class VIDEOSViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var videos = [VideoDetails]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    func loadVideos() {
        videos = Videos.getVideos()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadVideos()
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}

extension VIDEOSViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let videoCell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as? VideosTableViewCell else {
           fatalError("Could not locate tableViewCell")
        }
        
        let cellInRow = videos[indexPath.row]
        
        videoCell.configureCell(for: cellInRow)
        
        return videoCell
    }
    
    
}

extension VIDEOSViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
