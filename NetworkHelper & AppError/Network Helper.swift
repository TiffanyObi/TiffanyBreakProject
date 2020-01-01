//
//  Network Helper.swift
//  TiffanyBreakProject
//
//  Created by Tiffany Obi on 12/30/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import Foundation

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
    private var session: URLSession
    
    private init() {
        session = URLSession(configuration: .default)
    }
    
    func performTaskData(with request: URLRequest, completion: @escaping (Result<Data,AppError>) ->()) {
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.networkClientError(error)))
            }
            
            guard let urlResponse = response as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            switch urlResponse.statusCode {
            case 200...299:
                break // means everything is fine
                
            default:
                completion(.failure(.badStatusCode(urlResponse.statusCode)))
                return
            }
            
            completion(.success(data))
            
        }
        
        dataTask.resume()
    }
}
