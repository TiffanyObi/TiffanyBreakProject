//
//  NumberFunFacts.swift
//  TiffanyBreakProject
//
//  Created by Tiffany Obi on 1/8/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import Foundation

struct NumberNames: Decodable {
    let numbers: [String]
    
    static func getNumberNames() -> [String] {
       var groupOfNumberNames = [String]()
        
        guard let fileURL = Bundle.main.url(forResource: "NumberFun", withExtension: "json") else {
            fatalError(" could not locate file")
        }
        
        do {
            
        
        let data = try Data(contentsOf: fileURL)
        
            let names = try JSONDecoder().decode(NumberNames.self, from: data)
            
            groupOfNumberNames = names.numbers
            
        } catch {
            
            fatalError("could not load contents of data")
        }
        
        return groupOfNumberNames
}
}

