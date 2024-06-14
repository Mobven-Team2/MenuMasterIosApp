//
//  JWTDecoderHelper.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/11/24.
//

import Foundation
import JWTDecode

class JWTDecoderHelper {
    
    static func handleJWTToken(_ token: String, completion: @escaping (String?) -> Void) {
        do {
            let jwt = try decode(jwt: token)
            guard let userId = jwt.claim(name: "Id").string else {
                print("User ID bulunamadı")
                completion(nil)
                return
            }
            
            completion(userId)
        } catch {
            print("JWT decode hatası: \(error.localizedDescription)")
            completion(nil)
        }
    }
    
}
