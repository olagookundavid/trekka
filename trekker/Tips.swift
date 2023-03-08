//
//  Tips.swift
//  trekker
//
//  Created by David OH on 07/03/2023.
//

import Foundation

struct Tip: Decodable {
    let text: String
    let children: [Tip]?
    
    
    
}
