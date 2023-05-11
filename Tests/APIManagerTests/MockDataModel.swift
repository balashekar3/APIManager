//
//  MockDataModel.swift
//  
//
//  Created by Balashekar Vemula on 11/05/23.
//

import Foundation
@testable import APIManager

struct MockProductModel:Decodable {
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let image: String?
    let rating: Rating?
}
struct Rating: Decodable {
    let rate: Double?
    let count: Int?
}
