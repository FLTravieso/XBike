# 🚴 XBike

XBike is an iOS application that tracks cyclist ride movement and duration, using **SwiftData**, **CoreLocation**, **Swift Concurrency** and **GoogleMaps** while following **Clean Architecture** principles.

## 📌 Features
✅ **Ride Duration Tracking** – Uses a timer to measure ride time.  
✅ **Background Location Tracking** – Continuously updates location, even when the app is in the background.  
✅ **Ride History Storage** – Saves ride start and end locations, duration and distance history.  
✅ **Clean Architecture** – Follows best practices for maintainability and scalability.  
✅ **SwiftUI & Async/Await** – Uses modern Swift concurrency for efficiency.  


---

## ⚙️ Installation & Setup
### **1️⃣ Clone the Repository**
```sh
git clone https://github.com/FLTravieso/XBike.git
cd XBike
```

### **2️⃣ Open in Xcode**
- Open `XBike.xcodeproj` in **Xcode 16+**.
- Set your development team for code signing.

### **3️⃣ Enable Background Modes**
- **Xcode → Signing & Capabilities** → Enable:
  - `Background Location Updates`
  - `Background Processing`

- Add these keys to `Info.plist`:
  - Privacy - Location When In Use Usage Description
  - Privacy - Location Always Usage Description
  - Privacy - Location Always and When In Use Usage Description

### **4️⃣ Run the App on a Real Device or iOS Simulator**
---

## 📌 Usage
### Allow location permissions.
1. Allow location tracking when using the app.
2. Allow always location tracking.

### **Start a Ride**
1. Tap `Start` to begin tracking.
2. Move around to record distance.
**(If running in iOS Simulator go to Debug → Location and select: City Bicycle Ride, City Run or Freeway Drive before tapping start).**

### **End a Ride**
1. Tap `Stop` to stop tracking.
2. Tap `Store` to save the ride in your progress.

---

## 🛠 Tech Stack
- **Swift 6**
- **SwiftUI** – UI framework
- **SwiftData** – Persistent storage
- **CoreLocation** – GPS tracking
- **Swift Concurrency** – Async/Await for background processing
- **GMaps** - Map SDK
