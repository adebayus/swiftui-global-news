//
//  Category.swift
//  GlobalNews
//
//  Created by mymac on 17/09/23.
//

import Foundation

struct Category: Hashable {
    var name: String
    var nameColor: String
}

struct Source: Identifiable, Hashable, Codable {
    var id: String
    var name: String
    var description: String
    var url: String
    var category: String
    var language: String
    var country: String
}
