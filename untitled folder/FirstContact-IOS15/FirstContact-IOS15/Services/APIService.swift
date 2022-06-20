//
//  APIService.swift
//  FirstContact
//
//  Created by anhtq on R 4/06/01.
//

import Foundation
import Alamofire
enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}
class APIService {
    static let shared = APIService()
    
    func login(credentials: Credentials,
               completion: @escaping (Result<LoginResponses,Authentication.AuthenticationError>) -> Void) {
        // Request API
        AF.request("https://demo.first-contact.jp/cms/app/api/login",
                   method: .post,
                   parameters: credentials,
                   headers: nil).responseJSON { AFdata in
           
                let response = try! JSONDecoder().decode(LoginResponses.self, from: AFdata.data!)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    if response.status == true {
                        completion(.success(response))
                    } else {
                        completion(.failure(.invalidCredentials))
                    }
                }
        // end Request
        
    }
        
       
    
    }
}

