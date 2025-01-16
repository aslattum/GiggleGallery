# GiggleGallery

GiggleGallery is a fun and engaging photo gallery app designed specifically for kids. It allows children to explore and view their favorite photos from the device's photo library in a safe and user-friendly environment. The app features colorful visuals and simple navigation, making it easy for kids to enjoy their memories.

## Features

- **Kid-Friendly Design**: A bright and colorful interface that appeals to children.
- **Photo Library Access**: Fetches images from the user's photo library, allowing kids to see their favorite moments.
- **Pagination**: Loads a limited number of photos at a time to keep the experience smooth and engaging.
- **Fullscreen View**: Kids can tap on any photo to view it in fullscreen mode, with a simple "X" button to close the view.
- **Safe and Simple Navigation**: Designed with kids in mind, ensuring that navigation is intuitive and straightforward.

## Requirements

- iOS 14.0 or later
- Xcode 12.0 or later

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/GiggleGallery.git
   ```

2. Open the project in Xcode:
   ```bash
   open GiggleGallery.xcodeproj
   ```

3. Run the app on a simulator or a physical device.

## Usage

1. Upon launching the app, it will request permission to access the photo library. Make sure to allow access.
2. The app will display a grid of photos from your photo library, showcasing fun and memorable moments.
3. Kids can scroll down to load more photos as they explore.
4. Tapping on any photo will open it in fullscreen mode, where they can enjoy the image without distractions. They can close the fullscreen view by tapping the "X" button.

## Code Overview

### PhotoLibraryManager

- Responsible for fetching photos from the user's photo library.
- Implements pagination to load photos in chunks, ensuring a smooth experience for kids.

### ContentView

- Displays the grid of photos using a `LazyVGrid`.
- Handles user interactions, such as tapping on a photo to view it in fullscreen.

### FullscreenPhotoView

- Displays a single photo in fullscreen mode.
- Provides a simple close button for easy navigation back to the gallery.

## Future Improvements

- Add support for video playback alongside photos for a more dynamic experience.
- Implement fun filters or stickers that kids can apply to their photos.
- Enhance the UI with animations and sounds to make it even more engaging for children.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to Apple for providing the Photos framework.
- Inspired by the joy of sharing memories with children and creating a safe space for them to explore.
