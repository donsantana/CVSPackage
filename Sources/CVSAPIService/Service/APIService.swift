// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

struct APIService {
    static let shared = APIService()
    
    func fetchFlickrs(searchText: String) async -> [FlickrViewModel] {
        print(GlobalVariables.flickrUrl+searchText)
        guard let url = URL(string: GlobalVariables.flickrUrl+searchText) else {
            return []
        }
        
        let urlRequest = URLRequest(url: url)
        do {
            let (data,response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return []
            }
            let flickrResponse = try JSONDecoder().decode(FlickrResponse.self, from: data)
            var flickViewModelList: [FlickrViewModel] = []
            for item in flickrResponse.items {
                let flickrViewModel = FlickrViewModel(model: item)
                flickViewModelList.append(flickrViewModel)
            }
            return flickViewModelList
        } catch {
            print("Error: \(error)")
            return []
        }
    }
}
