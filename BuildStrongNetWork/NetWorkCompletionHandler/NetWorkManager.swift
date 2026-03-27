//
//  NetWorkManage.swift
//  BuildStrongNetWork
//
//  Created by Mohab Mowafy on 26/03/2026.
//

import Foundation



class NetWorkManage: NetWorkProtocol {
    func request<T>(endPoint: any EndPoint, completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable {
        guard let request = RequestBuilder.build(endPoint: endPoint) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.unknown))
            }
            
            guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode else {
            completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
            }catch {
                completion(.failure(.invalidDecodes))
            }
            
        }.resume()
    }
   
    
}
