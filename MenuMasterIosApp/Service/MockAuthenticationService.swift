//
//  MockAuthenticationService.swift
//  MenuMasterIosApp
//
//  Created by Barış Temiz on 23.05.2024.
//

import Foundation

class MockAuthenticationService {
    
    func login(request: LoginRequest, completion: @escaping (Result<LoginResponse,Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            if request.email == "admin@admin.com" && request.password == "123456" {
                let mockResponse = LoginResponse(accessToken: "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhZG1pbkBhZG1pbi5jb20iLCJJZCI6IjEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJBZG1pbiIsIkZ1bGxOYW1lIjoiYWRtaW5hZG1pbiIsImV4cCI6MTcxNjM4OTkxNywiaXNzIjoiTWVhbE1hdGVBUEkiLCJhdWQiOiJVc2VyIn0.Nsx6QPps9GT5wb6M6lrCbL-vLmlFSeIyriLP43mW5f0")
                completion(.success(mockResponse))
            } else {
                completion(.failure(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey : "Invalid credentials"])))
            }
        }
    }
    
    func register(request: RegisterRequest, completion: @escaping(Result<RegisterResponse,Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            let mockResponse = RegisterResponse(response: "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhZG1pbkBhZG1pbi5jb20iLCJJZCI6IjEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJBZG1pbiIsIkZ1bGxOYW1lIjoiYWRtaW5hZG1pbiIsImV4cCI6MTcxNjM5MDM3MSwiaXNzIjoiTWVhbE1hdGVBUEkiLCJhdWQiOiJVc2VyIn0.DWc0XYegzcsApJmSciOYWxcgW_nff6X7Yr8dkuVU3tI")
            completion(.success(mockResponse))
        }
    }
}
