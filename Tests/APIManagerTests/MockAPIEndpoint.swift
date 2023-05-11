//
//  MockAPIEndpoint.swift
//  
//
//  Created by Balashekar Vemula on 11/05/23.
//

import Foundation
@testable import APIManager

enum MockAPIEndpoint {
    case getProducts
    case sendNilRequst
}
extension MockAPIEndpoint: EndpointProtocol {
    var scheme: String {
        return "https"
    }
    var host: String {
        switch self {
        case .getProducts:
            return "fakestoreapi.com"
        case .sendNilRequst:
            return ""
        }
        
    }
    var path: String {
        switch self {
        case .getProducts:
            return "/products"
        case .sendNilRequst:
            return ""
        }
    }
    var method: RequestMethod {
        switch self {
        case .getProducts:
            return .get
        case .sendNilRequst:
            return .get
        }
    }
    var header: [String : String]? {
        switch self {
        default:
            return [
                "Content-Type": "application/json",
                "Accept":"application/json"
            ]
        }
    }
    var body: Encodable? {
        switch self {
        default:
            return nil
        }
    }
    var parameters: [URLQueryItem]? {
        switch self {
        default:
            return nil
        }
    }
}



