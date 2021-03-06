//
//  VideosTableViewCell.swift
//  TiffanyBreakProject
//
//  Created by Tiffany Obi on 12/27/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class VideosTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var videoTextView: UITextView!
    
    @IBOutlet weak var videoImageView: UIImageView!
    
    
    var video: VideoDetails!
    
    func configureCell(for video: VideoDetails ) {
        self.backgroundColor = .green
        
        videoTextView.text = video.videoURL
        videoTextView.backgroundColor = .systemTeal
        videoTextView.textColor = .black
        videoImageView.image = UIImage(named: video.image)
        
        videoImageView.layer.cornerRadius = 20
    }

}
