//
//  TiffanyBreakProjectTests.swift
//  TiffanyBreakProjectTests
//
//  Created by Tiffany Obi on 12/27/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import XCTest
@testable import TiffanyBreakProject

class TiffanyBreakProjectTests: XCTestCase {

    func testVideoModel(){
        
        struct Videos:Codable {
        let results: [VideoDetails]
        }
        
        struct VideoDetails:Codable {
            let name: String
            let videoURL: String
        }
        
        let json = """
        {
        "status": ["ok",
        "not okay",
        "good"
        ],
        "results": [{
            "name": "ABC Songs for Children",
            "videoURL": "https://www.youtube.com/watch?v=_UR-l3QI2nE"
        },
        {
            "name": "Outdoor Adventures with Peppa Pig!",
            "videoURL": "https://www.youtube.com/watch?v=Kd9mALZpb4c"
        },
        {
            "name": "Mickey Mouse Clubhouse",
            "videoURL": "https://www.youtube.com/watch?v=cC03A0OgMuA"
        }
        ]
        }

        """.data(using: .utf8)!
        
        let videos = try! JSONDecoder().decode(Videos.self, from: json)
        
        let videosCount = videos.results
        
        XCTAssertGreaterThan(videosCount.count, 2,"there are \(videosCount.count) videos ( should be 3). which is more than 2.")
        
    }

}
