//
//  Request.swift
//  Photo Search
//
//  Created by Sergey on 02.03.2021.
//

import UIKit

struct APIResponse: Codable {
    let total: Int
    let total_pages: Int
    let results: [Result]
}

struct Result: Codable {
    let id: String
    let urls: URLS
}

struct URLS: Codable {
    let small: String
}
