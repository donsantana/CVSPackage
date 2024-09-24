//
//  SwiftUIView.swift
//  CVSAPIService
//
//  Created by Done Santana on 9/23/24.
//

import SwiftUI

struct CardView: View {
    let flickrItem: FlickrViewModel
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                VStack {
                    AsyncImage(url: URL(string:"\(flickrItem.imageURL)")) { image in
                        image.resizable()
                            .frame(width: UIScreen.main.bounds.width/3,height: UIScreen.main.bounds.width/3)
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 10))
                    } placeholder: {
                        ProgressView()
                    }
                }
                
            }
        }
    }
}

#Preview {
    CardView(flickrItem: FlickrViewModel.mockItem)
}
