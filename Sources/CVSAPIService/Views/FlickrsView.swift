//
//  SwiftUIView.swift
//  CVSAPIService
//
//  Created by Done Santana on 9/23/24.
//

import SwiftUI

class AsyncViewModel: ObservableObject {
    @Published var data: [FlickrViewModel] = []
    
    init() {}
    
    @MainActor
    func fetchData(searchText: Binding<String>) async {
        data = await APIService.shared.fetchFlickrs(searchText: searchText.wrappedValue)
    }
}

public struct FlickrsView: View {
    @State private var flickrList: [FlickrViewModel] = []
    @StateObject var viewModel: AsyncViewModel = AsyncViewModel()
    @State var searchText: String = ""
    @State var isSearching: Bool = false
    @State var showDetailView = false

    
    public var body: some View {
        var flickrSelected: FlickrViewModel?
        NavigationStack {
            ZStack {
                if isSearching {
                    VStack {
                        Text("Loading...")
                        ProgressView()
                    }
                }
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: UIScreen.main.bounds.width/3))]) {
                        ForEach(viewModel.data.indices, id: \.self) { index in
                            CardView(flickrItem: viewModel.data[index])
                                .aspectRatio(5/4, contentMode: .fit)
                                .onTapGesture {
                                    flickrSelected = viewModel.data[index]
                                    showDetailView = true
                                }
                                .fullScreenCover(isPresented: $showDetailView) {
                                    if let flickrSelected = flickrSelected {
                                        FlickrDetailView(flickrItem: flickrSelected)
                                    }
                                }
                        }
                        .padding(.trailing, 10)
                        .padding(.top, 10)
                        .padding(.leading, 10)
                    }
                    
                }
                .toolbar {
                    
                }
                .navigationTitle("CVS Flickrs")
            }

            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Type the tag to search")
            .onChange(of: searchText) { _ in
                isSearching = true
                fetchFlickrs()
            }
        }
        .task {
            fetchFlickrs()
        }
    }

    
    public init() {
        
    }
    
    internal func fetchFlickrs() {
        Task {
            await viewModel.fetchData(searchText: $searchText)
            isSearching = false
        }
    }
}

#Preview {
    FlickrsView()
}
