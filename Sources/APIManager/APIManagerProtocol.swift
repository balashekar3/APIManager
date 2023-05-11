//
//  APIManagerProtocol.swift
//  
//
//  Created by Balashekar Vemula on 11/05/23.
//

import Foundation
public typealias Handler<T> = (Result<T,RequestError>)->Void
public protocol EndpointProtocol {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: Encodable? { get }
    var parameters: [URLQueryItem]? { get }
}
public protocol APIManagerProtocol {
    func getData<D:Decodable>(from endpoint:EndpointProtocol,with responseModel:D.Type,completion:@escaping Handler<D>)
}
