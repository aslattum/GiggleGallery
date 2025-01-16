//
//  ContentView.swift
//  GiggleGallery
//
//  Created by Adam Slattum on 1/16/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var photoManager = PhotoLibraryManager()
    @State private var selectedPhoto: Photo?
    @State private var isFullscreen: Bool = false
    @State private var currentIndex: Int = 0
    
    var body: some View {
        NavigationView {
            // Main Grid View
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 4),
                    GridItem(.flexible(), spacing: 4),
                    GridItem(.flexible(), spacing: 4)
                ], spacing: 4) {
                    ForEach(photoManager.photos.indices, id: \.self) { index in
                        let photo = photoManager.photos[index]
                        Image(uiImage: photo.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120) // Set fixed width and height
                            .clipped() // Ensure the image does not overflow
                            .onTapGesture {
                                selectedPhoto = photo
                                currentIndex = index // Set the current index
                                isFullscreen = true
                            }
                            .onAppear {
                                // Check if this is the last photo
                                if index == photoManager.photos.count - 1 {
                                    photoManager.loadMorePhotos() // Load more photos when the last photo appears
                                }
                            }
                    }
                }
                .padding()
            }
            .navigationTitle("Kids Photos (Have Fun)") // Set the navigation title
            .onAppear {
                photoManager.fetchPhotos() // Fetch photos when the view appears
            }
            .navigationTitle("Kids Photos (Have Fun)")
            .fullScreenCover(isPresented: $isFullscreen) {
                FullscreenPhotoView(photos: photoManager.photos, currentIndex: currentIndex, isFullscreen: $isFullscreen)
                    .transition(.move(edge: .bottom))
            }
        }
    }
}
