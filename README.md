# 🌦 Flutter Weather App

## 📌 Overview
Flutter Weather App is a **cross-platform weather application** built with **Flutter**. It fetches real-time weather data from an API and displays detailed weather conditions, including temperature, humidity, wind speed, and more. This project showcases the use of **REST API integration**, **state management**, and **clean UI design** in Flutter.

## ✨ Features
✅ Real-time weather updates  
✅ Search for weather by city name  
✅ Displays temperature, humidity, wind speed, and more  
✅ Beautiful and responsive UI  
✅ Dark & Light mode support  
✅ Uses **Provider** for state management  

---

## 🛠 Technologies Used
- 💙 **Flutter & Dart**
- ☁ **OpenWeatherMap API**
- 🎨 **Material Design**
- 📦 **Provider (State Management)**
- 🔄 **HTTP Requests (Dio or http package)**

---

## 📂 Project Structure
```plaintext
flutter_weather_app/
│── lib/
│   ├── models/
│   ├── providers/
│   ├── screens/
│   ├── services/
│   ├── widgets/
│── assets/
│── pubspec.yaml
│── README.md
│── LICENSE
```

---

## 🏗 Installation & Usage
### 🔹 Prerequisites
- 🛠 **Flutter SDK** installed
- 📱 **Android Emulator** or **Physical Device**
- 🔑 API Key from **OpenWeatherMap**

### 📥 Steps to Run the Application
1️⃣ **Clone the repository:**
   ```sh
   git clone https://github.com/emon2002926/flutter_weather_app.git
   ```
2️⃣ **Navigate to the project directory:**
   ```sh
   cd flutter_weather_app
   ```
3️⃣ **Install dependencies:**
   ```sh
   flutter pub get
   ```
4️⃣ **Run the app:**
   ```sh
   flutter run
   ```

---

## 🏛 Architecture
Flutter Weather App follows **MVVM (Model-View-ViewModel)** architecture:
- **📂 Model:** Defines data structures and API responses.
- **🧠 ViewModel (Provider):** Manages state and business logic.
- **🖥 View:** Screens and widgets displaying UI components.

---

## 🌍 API Integration
This app fetches weather data using the **OpenWeatherMap API**. To use this, obtain an API key from [OpenWeatherMap](https://openweathermap.org/) and add it to your project:
1. Create a `.env` file in the root directory.
2. Add your API key:
   ```sh
   WEATHER_API_KEY=your_api_key_here
   ```

---

## 🤝 Contributing
Contributions are **welcome**! If you'd like to improve the project, please follow these steps:
1. **Fork** the repository.
2. **Create a new branch:** `git checkout -b feature-name`.
3. **Commit your changes:** `git commit -m 'Add feature-name'`.
4. **Push to the branch:** `git push origin feature-name`.
5. **Open a Pull Request.**

---

## 📜 License
📄 This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

⭐ If you like this project, consider giving it a **star** on GitHub! ⭐


