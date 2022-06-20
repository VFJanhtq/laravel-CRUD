//
//  Credentials.swift
//  FirstContact
//
//  Created by anhtq on R 4/06/01.
//

import Foundation
struct Credentials: Codable {
    var username: String = ""
    var password: String = ""
}
struct LoginResponses:Decodable{
    let status : Bool
    let access_token : String
}
struct AccountCreations: Codable {
    var name:String?
    var name_last:String?
    var email:String?
    var password:String?
    var company:String?
    var tel_no:Int?
}
