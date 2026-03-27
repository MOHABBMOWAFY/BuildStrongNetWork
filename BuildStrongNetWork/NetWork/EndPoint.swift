//
//  EndPoint.swift
//  BuildStrongNetWork
//
//  Created by Mohab Mowafy on 26/03/2026.
//

import Foundation
protocol EndPoint {
    var baseUrl: String {get}
    var path: String {get}
    var queryParamter: [String:String]? {get}
    var method: HTTPMethod {get}
    var header: [String:String]? {get}
    var body: [String:String]? {get}
}
