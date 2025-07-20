# Shop
Casual Shop Project

Demo Recording: https://drive.google.com/file/d/1TMyVIiC_YrbY0k_yGK8IEo7NYS_CBGdV/view?usp=sharing
Screenshot: https://drive.google.com/drive/folders/1MFwa5RmjckfKcFoongx5sGnGoxVP5Vt6?usp=sharing

### How to Run:
- Open Xcode 16.4
- Build the Project and Run "Shop" target to selected Simulator

### API used:
- base URL: https://dummyjson.com/products
- with additional parameter: "limit=10&skip=10" to handle pagination
- final URL lookalike https://dummyjson.com/products?limit=10&skip=10

### Architecture:
- MVVM with Clean Architecture
- Feature based module

### Duration Estimation:
- Requirements check and Planning: 60 mins (1 hour)
- Sketch and Mockup: 30 mins
- Implementations, Debugging, etc: 300 mins (5 hours)
- Testing and Check: 30 mins
- Total duration estimation: 420 mins (7 hours)

### Notes:
- Added UI/UX improvement to handle shimmer effect loading using skeleton and pull to refresh behavior

### Future Enhacements:
- Implement image cache from URL
- Implement unit test and UI test
- Implement network call manager and handler
