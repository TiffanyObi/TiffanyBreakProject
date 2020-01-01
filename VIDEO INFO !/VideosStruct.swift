//
//  VideosStruct.swift
//  TiffanyBreakProject
//
//  Created by Tiffany Obi on 12/27/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import Foundation

struct Videos:Codable {
    let results: [VideoDetails]
}

struct VideoDetails:Codable {
    let name: String
    let videoURL: String
    let image: String
}

extension Videos {
    static func getVideos() -> [VideoDetails] {
     var videos = [VideoDetails]()
        
        guard let fileURL = Bundle.main.url(forResource: "VideosData", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let video = try JSONDecoder().decode(Videos.self, from: data)
            
            videos = video.results
        } catch {
            fatalError("failed to load contents \(error)")
        }
        
        
        return videos
    }
}
