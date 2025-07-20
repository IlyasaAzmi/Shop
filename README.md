# Shop
A SwiftUI casual shopping app with modern architecture and smooth user experience.

## Demo & Screenshots
- **Demo Recording**: [Watch on Google Drive](https://drive.google.com/file/d/1TMyVIiC_YrbY0k_yGK8IEo7NYS_CBGdV/view?usp=sharing)
- **Screenshots**: [View Gallery](https://drive.google.com/drive/folders/1MFwa5RmjckfKcFoongx5sGnGoxVP5Vt6?usp=sharing)

## Features
- **Product List**: List of products with pagination
- **Bookmark System**: Save and manage favorite products
- **Shimmer Loading**: Skeleton cards during initial load
- **Pull to Refresh**: Refresh product list with pull gesture
- **Tab Navigation**: Switch between Shop and Bookmarks
- **Error Handling**: User-friendly error alerts with retry options

## How to Run
1. Open **Xcode 16.4** or later
2. Build the project
3. Run "Shop" target on your selected iOS Simulator
4. **Requirements**: iOS 18.5+

## API Integration
- **Base URL**: `https://dummyjson.com/products`
- **Pagination**: Uses `limit=10&skip={offset}` parameters
- **Example**: `https://dummyjson.com/products?limit=10&skip=0`

## Architecture
- **MVVM + Clean Architecture**
- **Feature-Based Modules**
  - Shop Feature (Product listing)
  - Bookmark Feature (Saved products)

## Development Timeline
- **Planning & Analysis**: 60 mins
- **UI/UX Design**: 30 mins  
- **Implementation & Debugging**: 300 mins
- **Testing & QA**: 30 mins
- **Total**: ~7 hours

## Technical Highlights
- SwiftUI with iOS 18.5+ features
- Async/await for network calls
- Custom shimmer animation
- MainActor concurrency handling

## Future Enhancements
- [ ] Image caching implementation
- [ ] Unit and UI test coverage
- [ ] Enhanced network manager
- [ ] Offline mode with Core Data
- [ ] Search and filtering capabilities
- [ ] Product detail view
