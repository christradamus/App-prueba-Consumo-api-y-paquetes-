//
//  NetworkingProvider.swift
//  test
//
//  Created by Christian Pérez on 05-09-23.
//

import Foundation
import Alamofire

final class NetworkingProvider {
    
    static let shared = NetworkingProvider()
    
    private let kBaseUrl = "https://gorest.co.in/public-api/"
    private let kStatusOk = 200...299
    private let kToken = "d35bb92367894b763286c83435e73112ce42056518baf652b5b9432509de593c"
    
    func getUser(id:Int,
                 success: @escaping (_ user: User) -> (),
                 failure: @escaping (_ error: Error?) -> ()) {
        let url = "\(kBaseUrl)users/\(id)"
        
        AF.request(url, method: .get).validate(statusCode: kStatusOk).responseDecodable (of: UserResponse.self) { response in
            if let user = response.value?.data {
               success(user)
            } else {
                failure(response.error)
            }
        }
    }
    
    func addUser(user: NewUser,
                 success: @escaping (_ user: User) -> (),
                 failure: @escaping (_ error: Error?) -> ()) {
        let url = "\(kBaseUrl)users"
        
        let headers:HTTPHeaders = [.authorization(bearerToken: kToken)]
        
        AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: kStatusOk).responseDecodable (of: UserResponse.self) { response in
            if let user = response.value?.data , user.id != nil {
               success(user)
            } else {
                failure(response.error)
            }
        }
    }
    
    func updateUser(id: Int, user: NewUser,
                 success: @escaping (_ user: User) -> (),
                 failure: @escaping (_ error: Error?) -> ()) {
        let url = "\(kBaseUrl)users/\(id)"
        
        let headers:HTTPHeaders = [.authorization(bearerToken: kToken)]
        
        AF.request(url, method: .put, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: kStatusOk).responseDecodable (of: UserResponse.self) { response in
            if let user = response.value?.data , user.id != nil {
               success(user)
            } else {
                failure(response.error)
            }
        }
    }
    
    func deleteUser(id: Int,
                 success: @escaping () -> (),
                 failure: @escaping (_ error: Error?) -> ()) {
        let url = "\(kBaseUrl)users/\(id)"
        
        let headers:HTTPHeaders = [.authorization(bearerToken: kToken)]
        
        AF.request(url, method: .delete, headers: headers).validate(statusCode: kStatusOk).response
        { response in
            if let error = response.error {
                failure(error)
            } else {
                success()
            }
        }
    }
}
