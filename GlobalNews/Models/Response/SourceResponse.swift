//
//  SourceResponse.swift
//  GlobalNews
//
//  Created by mymac on 18/09/23.
//

import Foundation

struct SourceResponse: Encodable, Decodable, Hashable {
    var status: String
    var sources: [Source] = []
}
