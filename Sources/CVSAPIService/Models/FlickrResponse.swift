//
//  File.swift
//  CVSAPIService
//
//  Created by Done Santana on 9/23/24.
//

import Foundation

struct FlickrResponse: Decodable {
    var title: String
    var link: String
    var description: String
    var modified: String
    var generator: String
    var items: [FlickrItem]
}
