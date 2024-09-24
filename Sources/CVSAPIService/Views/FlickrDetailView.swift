//
//  SwiftUIView.swift
//  CVSAPIService
//
//  Created by Done Santana on 9/23/24.
//

import SwiftUI

struct FlickrDetailView: View {
    @Environment(\.dismiss) var dismiss
    let flickrItem: FlickrViewModel
    
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Spacer()
                    AsyncImage(url: URL(string: flickrItem.imageURL)) { image in
                        image.resizable()
                            .frame(width: UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.width/1.5)
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 10))
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
                
                Section("Description") {
                    AttributedText(NSAttributedString(string: flickrItem.Description))
                }
                Section("Meta data") {
                    VStack(alignment:.leading) {
                        Text("Author: ").font(.caption)
                        Text("\(flickrItem.author)")
                    }
                    VStack(alignment: .leading) {
                        Text("Published Date:").font(.caption)
                        Text("\(flickrItem.publishedDate)")
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                       dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }.navigationTitle(flickrItem.title)
            ShareLink(item: URL(string: flickrItem.imageURL)!, subject: Text(flickrItem.title)) {
                Label("Share", systemImage: "square.and.arrow.up")
            }
        }
    }
}

#Preview {
    FlickrDetailView(flickrItem: FlickrViewModel.mockItem)
}

struct AttributedText: UIViewRepresentable {
    private let attributedString: NSAttributedString

    init(_ attributedString: NSAttributedString) {
        self.attributedString = attributedString
    }

    func makeUIView(context: Context) -> UITextView {
        // Called the first time SwiftUI renders this "View".

        let uiTextView = UITextView()

        // Make it transparent so that background Views can shine through.
        uiTextView.backgroundColor = .clear

        // For text visualisation only, no editing.
        uiTextView.isEditable = false

        // Make UITextView flex to available width, but require height to fit its content.
        // Also disable scrolling so the UITextView will set its `intrinsicContentSize` to match its text content.
        uiTextView.isScrollEnabled = false
        uiTextView.setContentHuggingPriority(.defaultLow, for: .vertical)
        uiTextView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        uiTextView.setContentCompressionResistancePriority(.required, for: .vertical)
        uiTextView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

        return uiTextView
    }

    func updateUIView(_ uiTextView: UITextView, context: Context) {
        uiTextView.attributedText = attributedString
    }
}
