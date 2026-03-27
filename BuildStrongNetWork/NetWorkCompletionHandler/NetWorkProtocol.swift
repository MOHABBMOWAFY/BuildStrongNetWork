//
//  NetWorkProtocol.swift
//  BuildStrongNetWork
//
//  Created by Mohab Mowafy on 26/03/2026.
//

import Foundation

protocol NetWorkProtocol {
    func request<T:Decodable>(endPoint: EndPoint,completion: @escaping (Result<T, APIError>) -> Void)
}

//protocol NetWorkProtocolAsync {
//    
//}
