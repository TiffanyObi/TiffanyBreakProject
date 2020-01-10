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

   func testNumberFunFactsApiForData() {
        let exp = XCTestExpectation(description: "search found")
    
    let numberFunFactURL = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
    
        let request = URLRequest(url: URL(string: numberFunFactURL)!)
        
    NetworkHelper.shared.performTaskData(with: request) { (result) in
            switch result {
            case .failure(let appError):
                XCTFail("appError: \(appError)")
                
            case .success(let data):
                exp.fulfill()
                
                XCTAssertGreaterThan(data.count, 8_000, "data.count:\(data) should be greater that 71,000bytes .")
            }
        }
        
        wait(for: [exp], timeout: 5.0)
    }

    func testNumberFunFactsModel() {
        
        struct Numbers: Decodable {
            
            let numbers: [String]
        }
        
    let json = """
        {
            "numbers": [
                "one.jpg",
                "two.jpg",
                "three.jpg",
                "four.jpg",
                "five.jpg"

            ]

        }
        """.data(using: .utf8)!
        
        let funfact = try! JSONDecoder().decode(Numbers.self, from: json)
        
        XCTAssertEqual(funfact.numbers.first, "one.jpg")

    }
}
