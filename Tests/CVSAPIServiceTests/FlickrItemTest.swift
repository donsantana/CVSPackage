//
//  Test.swift
//  CVSAPIService
//
//  Created by Done Santana on 9/24/24.
//

import Testing
import CVSAPIService

@MainActor class FlickrItemTest: XCTestCase {
 private var flickItem: FlickrItem!
    
    override init() async throws {
        flickItem = FlickrItem.mockItem
    }
    
    @Test func testInit() async throws {
        #expect(flickItem.title == "Crested Porcupine")
        #expect(flickItem.link == "https://www.flickr.com/photos/coastermadmatt/54013510363/")
        #expect(flickItem.description ==  "<p><a href=\"https://www.flickr.com/people/coastermadmatt/\">CoasterMadMatt</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/coastermadmatt/54013510363/\" title=\"Crested Porcupine\"><img src=\"https://live.staticflickr.com/65535/54013510363_96e701ec86_m.jpg\" width=\"240\" height=\"160\" alt=\"Crested Porcupine\" /></a></p>")
    }

}
