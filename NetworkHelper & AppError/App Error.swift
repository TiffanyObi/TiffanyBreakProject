//
//  App Error .swift
//  TiffanyBreakProject
//
//  Created by Tiffany Obi on 12/30/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import Foundation

enum AppError: Error {
    case badURL(String) // associated value
    case noResponse
    case networkClientError(Error) // no internet connection
    case noData
    case decodingError(Error)
    case encodingError(Error)
    case badStatusCode(Int) // 404, 500
    case badMimeType(String) // image/jpg
}
