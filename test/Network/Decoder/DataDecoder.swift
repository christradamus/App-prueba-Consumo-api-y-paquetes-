//
//  DataDecoder.swift
//  test
//
//  Created by Christian Pérez on 05-09-23.
//

import Foundation

final class DataDecoder: JSONDecoder {
    
    let dateFormatter = DateFormatter()
    
    override init() {
        super.init()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
        dateDecodingStrategy = .formatted(dateFormatter)
    }
}
