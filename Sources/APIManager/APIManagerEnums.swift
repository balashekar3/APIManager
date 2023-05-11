//
//  APIManagerEnums.swift
//  
//
//  Created by Balashekar Vemula on 11/05/23.
//

import Foundation
public enum RequestMethod:String{
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
    
}
public enum RequestError: Error {
    case decodeError
    case invalidURL
    case noResponse
    case noData
    case unauthorized
    case unexpectedStatusCode
    case unknown
    case invalidResponse
}
