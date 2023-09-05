//
//  User.swift
//  test
//
//  Created by Christian Pérez on 05-09-23.
//

import Foundation

struct UserResponse: Decodable {
    
    let code: Int?
    let meta: Meta?
    let data: User?
}

struct User: Decodable {
    
    let id: Int?
    let name: String?
    let email: String?
    let gender: String?
    let status: String?
    //let create_at: Date
    //let updated_at: Date
    
}

struct Meta: Decodable {
    
}
