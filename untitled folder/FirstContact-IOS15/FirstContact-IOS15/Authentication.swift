//
//  Authentication.swift
//  FirstContact
//
//  Created by anhtq on R 4/06/01.
//

import SwiftUI

class Authentication: ObservableObject {
    @Published var accessToken = ""
    
    enum AuthenticationError: Error, LocalizedError, Identifiable{
        case invalidCredentials
        
        var id: String{
            self.localizedDescription
        }
        
        var errorDescription: String?{
            switch self {
            case .invalidCredentials:
                return "try agian"
            }
        }
    }
    
    func updateValidation(accessToken: String){
        withAnimation{
            self.accessToken = accessToken
        }
    }
    
    
}
