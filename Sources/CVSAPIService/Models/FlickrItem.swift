//
//  File.swift
//  CVSAPIService
//
//  Created by Done Santana on 9/23/24.
//

import Foundation

struct Media: Decodable {
    var mediaURL: String
    
    enum CodingKeys: String, CodingKey {
        case mediaURL = "m"
    }
}

struct FlickrItem: Decodable {
    var title: String
    var link: String
    var description: String
    var media: Media
    var published: String
    var dateTaken: String
    var author: String
    var authorID: String
    var tags: String
    
    enum CodingKeys: String, CodingKey {
        case title, link, description, media, published, author, tags
        case dateTaken = "date_taken"
        case authorID = "author_id"
    }
    
    static var mockItem: FlickrItem {
        return FlickrItem(title: "Crested Porcupine",link: "https://www.flickr.com/photos/coastermadmatt/54013510363/",description: "<p><a href=\"https://www.flickr.com/people/coastermadmatt/\">CoasterMadMatt</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/coastermadmatt/54013510363/\" title=\"Crested Porcupine\"><img src=\"https://live.staticflickr.com/65535/54013510363_96e701ec86_m.jpg\" width=\"240\" height=\"160\" alt=\"Crested Porcupine\" /></a></p>", media: .init(mediaURL: "https://live.staticflickr.com/65535/54013510363_96e701ec86_m.jpg"),
                          published: "2024-07-07T15:56:16-08:00",
                          dateTaken: "2024-09-22T16:17:56Z",
                          author: "nobody@flickr.com (\"CoasterMadMatt\")",
                          authorID: "15523409@N05",
              tags: "chessingtonworldofadventures2024 chessington chessingtonworldofadventures 2024season chessingtonzoo crestedporcupine crested porcupine animal animals zoo chessingtonworldofadventuresthemepark themepark themeparks amusementpark theme park chessingtonworldofadventuresresort merlinentertainments greaterlondon london england britain greatbritain gb unitedkingdom uk europe july2024 summer2024 july summer 2024 nikond5600 photo photos photographs photography coastermadmattphotography coastermadmatt")
    }
}
