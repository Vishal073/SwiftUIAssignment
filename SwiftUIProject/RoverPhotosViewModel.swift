import Foundation

class RoverPhotosViewModel:  ObservableObject {
    
    @Published var roverPhotos: [RoverPhotoObject] = []
    private let realmManager = RealmManager()
    
    // fetch data from cache if it's available otherwise fetch data from the API
    func fetchAndCacheData() {
        let cachedPhotos = realmManager.fetchPhotos()
        if !cachedPhotos.isEmpty {
            self.roverPhotos = cachedPhotos
        } else {
            fetchDataFromAPI()
        }
    }
    
    // fetch data from API
    private func fetchDataFromAPI() {
        NetworkManager.shared.fetchRoverPhotos { result in
            switch result {
            case .success(let roverPhoto):
                DispatchQueue.main.async {
                    self.realmManager.savePhotos(roverPhoto.photos)
                    self.roverPhotos = self.realmManager.fetchPhotos()
                }
            case .failure(let error):
                print("Failed to fetch data:", error.localizedDescription)
            }
        }
    }
}
