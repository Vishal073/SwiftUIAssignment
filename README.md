# SwiftUIAssignment

An iOS app built with **SwiftUI** that fetches and displays Mars Rover photos from NASA's API.

---

## 📌 Setup Instructions

### **1️⃣ Clone the Repository**
```sh
git clone https://github.com/yourusername/MyiOSProject.git
cd MyiOSProject
```

### **2️⃣ Add Your API Key**
This project requires a **NASA API key** for fetching data.  

```swift
struct Constants {
    static let apiKey = "UJiC6fK8Rl3bBdhlEYTAsGCeIGl3UBTcmgEbytHR"
}
```

## 📌 Architecture Overview

This project follows the **MVVM (Model-View-ViewModel)** architecture:

### **1️⃣ Model (`RoverPhoto.swift`)**
Defines data structures that represent API responses.

### **2️⃣ ViewModel (`RoverPhotosViewModel.swift`)**
- Fetches and caches data.
- Uses **`@Published`** properties to update the UI reactively.
- Handles **network requests** and **error handling**.

### **3️⃣ View (`RoverPhotosView.swift`)**
- Displays a list of Mars Rover photos.
- Uses `@StateObject` to observe the `ViewModel`.
- Supports **dark/light mode switching**.

### **4️⃣ Data Persistence (`RealmManager.swift`)**
- Uses **Realm** to cache API responses for offline access.
- Saves fetched photos locally to prevent redundant API calls.

---

## 📌 Trade-offs Made

### ✅ **Advantages**
1. **MVVM architecture** keeps UI and logic separate.
2. **Offline support with Realm** improves user experience.
3. **SwiftUI & Combine** make the UI reactive and declarative.
4. **Dark mode support** enhances accessibility.

### ⚠️ **Trade-offs**
1. **No CoreData support** – Chose **Realm** for simpler data persistence.
2. **No pagination in API calls** – Currently fetching all data at once.
3. **Static API key approach** – For production, use **secure storage** like Keychain.

---

## 📌 External Resources & Libraries Used

### **1️⃣ Realm**
- Used for offline data storage.
- Provides better performance compared to CoreData for simple use cases.

### **2️⃣ NASA API**
- Source of Mars Rover images.
- Public API with free access.

### **3️⃣ SwiftUI **
- Used for building a reactive UI.
- Enables smooth state management.

### **4️⃣ URLSession**
- Used for making network requests.
- Fetches JSON data from NASA’s API.

---
