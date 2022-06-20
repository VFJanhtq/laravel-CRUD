//
//  LoginViewModel.swift
//  FirstContact
//
//  Created by anhtq on R 4/06/01.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var credentials = Credentials()
    @Published var accountCreations = AccountCreations()
    @Published var showProgressView = false
    @Published var isError = false
    @Published var error: Authentication.AuthenticationError?
    
//    var loginDisabled: Bool {
//        credentials.username.isEmpty || credentials.password.isEmpty
//    }
    
    func login(completion: @escaping (String) -> Void) {
        showProgressView = true
        APIService.shared.login(credentials: credentials) { [unowned self](result:Result<LoginResponses, Authentication.AuthenticationError>) in
         showProgressView = false
            switch result {
            case .success(let response):
                completion(response.access_token)
            case .failure(let authError):
                credentials = Credentials()
                error = authError
                isError = true
                completion("")
            }
        }
    }
}
