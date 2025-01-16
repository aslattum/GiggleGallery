//
//  FullscreenPhotoView.swift
//  GiggleGallery
//
//  Created by Adam Slattum on 1/16/25.
//

import SwiftUI

struct FullscreenPhotoView: View {
    let photos: [Photo] // Array of Photo objects
    @State var currentIndex: Int
    @Binding var isFullscreen: Bool

    var body: some View {
        ZStack(alignment: .topTrailing) {
            TabView(selection: $currentIndex) {
                ForEach(photos.indices, id: \.self) { index in
                    ZStack(alignment: .topTrailing) {
                        Image(uiImage: photos[index].image)
                            .resizable()
                            .aspectRatio(contentMode: .fit) // Maintain aspect ratio
                            .tag(index)
                        
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Page style for swiping
            .background(Color.black) // Ensure the background is black
            Button {
                isFullscreen = false
            } label: {
                ZStack(alignment: .center) {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 14))
                    Circle()
                        .stroke(Color.white)
                        .frame(width: 28, height: 28)
                }
                .clipShape(Circle())
            }
            .padding(.trailing, 20)
        }
        .background(Color.black)
    }
}
