//
//  RegisterService.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/3/24.
//

import Foundation
import Combine

class RegisterService {
    @Published var registerResponse: UserRegisterSuccessResponse
    
    var registerSubscription: AnyCancellable?
    
    init(){
        registerResponse = UserRegisterSuccessResponse(response: "")
    }
    
    func registerUser(body: Data) {
        registerSubscription = NetworkManager.sendPostRequest(url: constructURL(for: .registerUser), body: body)
            .decode(type: UserRegisterSuccessResponse.self, decoder: JSONDecoder())
            .map { $0}
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedResponse) in
                self?.registerResponse.response = returnedResponse.response
                self?.registerSubscription?.cancel()
            })
    }
    
    private func constructURL(for endpoint: MenuMasterEndpoints) -> URL {
        let urlWithParams = API.prepareUrl(withPath: endpoint.path)
        return urlWithParams
    }
}
