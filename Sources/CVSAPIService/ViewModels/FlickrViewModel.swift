//
//  FlickrViewModel.swift
//  CVSAPIService
//
//  Created by Done Santana on 9/23/24.
//

import Foundation

public struct FlickrViewModel: Identifiable, Sendable {
    public var id: String = UUID().uuidString
    
    private let model: FlickrItem
    
    init(model: FlickrItem) {
        self.model = model
    }
    
    var title: String {
        return model.title
    }
    var Description: String {
        return model.description
    }
    var author: String {
        return model.author
    }
    var publishedDate: String {
        return model.published.convertToDate()
    }
    
    
    var imageURL: String {
        return model.media.mediaURL
    }
    
    static var mockItem: FlickrViewModel {
        return .init(model: FlickrItem.mockItem)
    }
}
