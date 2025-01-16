//
//  PhotoLibraryManager.swift
//  GiggleGallery
//
//  Created by Adam Slattum on 1/16/25.
//

import Photos
import UIKit

class PhotoLibraryManager: ObservableObject {
    @Published var photos: [Photo] = []
    private var allPhotos: [Photo] = [] // Store all photos
    private var currentPage: Int = 0
    private let pageSize: Int = 20 // Number of photos to load per page

    func fetchPhotos() {
        let fetchOptions = PHFetchOptions()
        let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)

        let imageManager = PHImageManager.default()
        let targetSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height) // Fullscreen size

        fetchResult.enumerateObjects { (asset, _, _) in
            let options = PHImageRequestOptions()
            options.isSynchronous = false // Load images asynchronously
            options.deliveryMode = .highQualityFormat // Request high-quality images

            imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFill, options: options) { (image, _) in
                if let image = image {
                    let photo = Photo(image: image) // Assuming Photo has an id and image property
                    self.allPhotos.append(photo)
                    // Load the first page of photos immediately
                    if self.allPhotos.count <= self.pageSize {
                        self.photos.append(photo)
                    }
                }
            }
        }
        
        // Load the first page of photos
        loadMorePhotos()
    }

    func loadMorePhotos() {
        let startIndex = currentPage * pageSize
        let endIndex = min(startIndex + pageSize, allPhotos.count)

        guard startIndex < allPhotos.count else { return } // No more photos to load

        let newPhotos = Array(allPhotos[startIndex..<endIndex])
        photos.append(contentsOf: newPhotos)
        currentPage += 1
    }
}

struct Photo: Identifiable, Hashable {
    let id = UUID()
    let image: UIImage
}
