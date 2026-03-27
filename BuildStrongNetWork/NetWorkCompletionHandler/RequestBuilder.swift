//
//  RequestBuilder.swift
//  BuildStrongNetWork
//
//  Created by Mohab Mowafy on 26/03/2026.
//

import Foundation

class RequestBuilder {
    
    static func build(endPoint: EndPoint) -> URLRequest? {
        guard var component = URLComponents(string: endPoint.baseUrl + endPoint.path) else {
            return nil
        }
        
        if let paramter = endPoint.queryParamter {
            component.queryItems = paramter.map({
                URLQueryItem(name: $0.key, value: $0.value)
            })
        }
        
        guard let url = component.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        
        endPoint.header?.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
       
        return request
        
        
    }
}
