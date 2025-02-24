
import SwiftUI


struct RoverPhotosView: View {
    @StateObject var viewModel = RoverPhotosViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State private var isDarkMode = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Button(action: toggleMode) {
                        Text(isDarkMode ? "Light Mode" : "Dark Mode")
                            .padding()
                            .background(Capsule().fill(Color.indigo))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                List(viewModel.roverPhotos, id: \.id) { photo in
                    NavigationLink(destination: DetailView(roverPhoto: photo)) {
                        VStack {
                            ImageView(imageUrl: photo.imgSrc)
                            Text(photo.roverName)
                            Text("Landing Date: \(photo.landingDate)")
                            Text("Launch Date: \(photo.launchDate)")
                            Text("Status: \(photo.status.capitalized)")
                            Spacer(minLength: 10)
                        }
                        .padding()
                    }
                }
                .onAppear {
                    viewModel.fetchAndCacheData()
                }
            }
            .navigationTitle("Rover Information")
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
    
    func toggleMode() {
        isDarkMode.toggle()
    }
}

// image UI where image is shown
struct ImageView: View {
    let imageUrl: String
    @State private var imageData: Data? = nil
    
    var body: some View {
        VStack {
            if let imageData = imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            } else {
                ProgressView()
                    .frame(height: 200)
                    .onAppear { loadImage() }
            }
        }
    }
    // load image from URL using URL session
    private func loadImage() {
        guard let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                self.imageData = data
            }
        }.resume()
    }
}

