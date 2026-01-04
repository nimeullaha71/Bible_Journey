# Bible Journey 📖

A comprehensive Flutter-based mobile application designed to guide users through their spiritual journey with daily devotionals, Bible study, prayers, reflections, and personalized journeys.

## 📋 Table of Contents

- Overview
- Features
- Tech Stack
- Project Structure
- Getting Started
- Installation
- Configuration
- Architecture
- Key Features Breakdown
- API Integration
- Localization
- Platform Support
- Development
- Building for Production
- Contributing
- License

## 🎯 Overview

Bible Journey is a spiritual companion app that helps users:
- Engage with daily devotionals and Bible readings
- Track their spiritual progress through personalized journeys
- Access prayers and reflections
- Participate in quizzes and assessments
- Manage their profile and subscription
- Receive personalized content based on their spiritual journey

The app provides a structured approach to spiritual growth with features like daily actions, progress tracking, and multi-language support.

## ✨ Features

### 🔐 Authentication & Security
- **User Registration**: Sign up with full name, email, phone, and password
- **Login System**: Secure authentication with email and password
- **Password Recovery**: Forgot password flow with OTP verification
- **OTP Verification**: Email-based OTP for password reset
- **Session Management**: Token-based authentication with secure storage
- **Account Management**: Profile editing, password change, account deactivation

### 🏠 Home Dashboard
- **Daily Content**: Today's prayer, devotion, and actions
- **Progress Overview**: Track your spiritual journey progress
- **Notifications**: Real-time notifications with unread count
- **Quick Access**: Easy navigation to all main features
- **User Profile Display**: Personalized greeting and user information

### 📖 Bible Reading
- **Complete Bible Access**: Old and New Testament books
- **Chapter Navigation**: Easy browsing through chapters and verses
- **Book Selection**: Organized by testament (Old/New)
- **Reading Interface**: Clean, readable Bible text display
- **Search & Navigation**: Quick access to specific books and chapters

### 🗺️ Journey System
- **Multiple Journeys**: Various spiritual journey paths
- **Daily Steps**: Structured daily activities and content
- **Progress Tracking**: Visual progress indicators
- **Journey Details**: Detailed information about each journey
- **Step Completion**: Mark steps as complete to track progress
- **Content Types**: Prayers, devotions, reflections, and actions

### 🙏 Prayer & Devotion
- **Daily Prayers**: Access daily prayer content
- **Audio Prayers**: Listen to prayers with audio player
- **Daily Devotions**: Inspirational daily devotionals
- **Devotion Quizzes**: Test your understanding with quizzes
- **Reflection Time**: Daily reflection prompts and activities

### 📝 Quizzes & Assessments
- **Daily Quizzes**: Quiz questions related to devotions
- **Questionnaire System**: Initial assessment for personalization
- **Quiz Results**: View scores and feedback

### 👤 Profile Management
- **Profile Information**: View and edit personal details
- **Profile Picture**: Upload and manage profile images
- **Language Selection**: Choose from 6 supported languages
- **Subscription Management**: View and manage subscription status
- **Payment History**: Access invoices and payment records
- **Settings**: Privacy policy, terms of service, help & support
- **Account Actions**: Change password, deactivate account

### 💳 Payment & Subscription
- **Subscription Plans**: Multiple subscription options
- **Payment Integration**: Secure payment processing
- **Payment Methods**: Support for various payment options (Visa, etc.)
- **Trial Period**: Free trial with expiration handling
- **Deep Linking**: Payment success callback handling

### 🌍 Localization
- **Multi-language Support**: 6 languages supported
    - English (en)
    - French (fr)
    - German (de)
    - Italian (it)
    - Portuguese (pt)
    - Spanish (es)
- **Dynamic Language Switching**: Change language on the fly
- **Localized Content**: All UI text and content translated

### 🔔 Notifications
- **Push Notifications**: Receive important updates
- **Notification Center**: View all notifications
- **Unread Count**: Track unread notifications
- **Notification Management**: Mark as read, clear notifications

### 📊 Progress Tracking
- **Journey Progress**: Track completion of journey steps
- **Daily Progress**: Monitor daily activities
- **Completion Status**: Visual indicators for completed items
- **Statistics**: View overall spiritual growth metrics

## 🛠️ Tech Stack

### Core Framework
- **Flutter SDK**: `^3.9.2` - Cross-platform mobile development framework
- **Dart**: Programming language

### Key Dependencies
- **easy_localization**: `^3.0.8` - Internationalization and localization
- **http**: `^1.6.0` - HTTP client for API calls
- **shared_preferences**: `^2.5.4` - Local data persistence
- **flutter_svg**: `^2.2.3` - SVG image rendering
- **pin_code_fields**: `^8.0.1` - OTP input fields
- **just_audio**: `^0.10.5` - Audio playback for prayers
- **image_picker**: `^1.2.1` - Image selection from gallery/camera
- **url_launcher**: `^6.3.2` - Launch URLs and deep links
- **app_links**: `^7.0.0` - Deep linking support
- **webview_flutter**: `^4.13.0` - WebView for external content
- **device_preview**: `^1.3.1` - Device preview for development

### Development Tools
- **flutter_lints**: `^5.0.0` - Linting rules for Flutter
- **flutter_launcher_icons**: `^0.14.4` - Generate app icons

## 📁 Project Structure

```
lib/
├── app/                          # App-level configuration
│   ├── app.dart                  # Main app widget with deep linking
│   ├── app_string.dart           # App-wide string constants
│   ├── constants.dart            # Colors, images, text styles, sizes
│   ├── route_args.dart           # Route argument models
│   ├── routes.dart               # Route definitions and navigation
│   └── Urls.dart                 # API endpoint URLs
│
├── core/                         # Core functionality
│   ├── models/                   # Shared data models
│   ├── services/                 # Core services (auth, API, storage)
│   └── utils/                    # Utility functions
│
├── features/                     # Feature modules
│   ├── auth/                     # Authentication feature
│   │   ├── screens/              # Login, signup, forgot password, OTP
│   │   └── widgets/              # Auth-specific widgets
│   │
│   ├── bible/                    # Bible reading feature
│   │   ├── model/                # Bible data models
│   │   ├── screens/              # Bible and chapter screens
│   │   ├── services/             # Bible API service
│   │   └── widgets/              # Bible UI components
│   │
│   ├── devotions/                # Devotions feature
│   │   ├── models/               # Devotion and quiz models
│   │   ├── providers/            # State management
│   │   ├── screens/              # Devotion screens
│   │   ├── services/             # Devotion API services
│   │   └── widgets/              # Devotion UI components
│   │
│   ├── home/                     # Home dashboard
│   │   ├── models/               # Notification models
│   │   ├── screen/               # Home screen
│   │   ├── services/             # Home data services
│   │   └── widgets/              # Home UI components
│   │
│   ├── journeys/                 # Journey system
│   │   ├── models/               # Journey data models
│   │   ├── screens/              # Journey screens
│   │   ├── services/             # Journey API services
│   │   └── widgets/              # Journey UI components
│   │
│   ├── payment/                  # Payment feature
│   │   ├── payment_screen.dart
│   │   └── payment_input_field.dart
│   │
│   ├── prayer/                   # Prayer feature
│   │   ├── models/               # Prayer models
│   │   ├── screens/              # Prayer screen
│   │   ├── services/             # Prayer API service
│   │   └── widgets/              # Audio player widget
│   │
│   ├── Profile/                  # Profile management
│   │   ├── models/               # Profile and invoice models
│   │   ├── screens/              # Profile screens
│   │   ├── services/             # Profile services
│   │   └── widgets/              # Profile UI components
│   │
│   ├── progress/                 # Progress tracking
│   │   └── services/             # Progress API service
│   │
│   ├── questionnaire/            # Initial questionnaire
│   │   ├── models/               # Quiz models
│   │   ├── screens/              # Question screens
│   │   └── widget/               # Quiz widgets
│   │
│   ├── quizzes/                  # Quiz system
│   │   ├── providers/            # Quiz state management
│   │   ├── screens/              # Quiz screens
│   │   └── widgets/              # Quiz UI components
│   │
│   ├── reflection/               # Reflection feature
│   │   └── screens/             # Reflection screen
│   │
│   └── todays_actions/           # Today's actions
│       ├── models/               # Action models
│       ├── providers/            # State management
│       ├── screens/              # Action screen
│       ├── services/             # Action API service
│       └── widgets/              # Action UI components
│
├── localization/                 # Translation files
│   ├── en.json                   # English
│   ├── fr.json                   # French
│   ├── de.json                   # German
│   ├── it.json                   # Italian
│   ├── pt.json                   # Portuguese
│   └── es.json                   # Spanish
│
├── widgets/                      # Shared widgets
│   ├── appbars/                  # Custom app bars
│   ├── buttons/                   # Custom buttons
│   ├── cards/                    # Card widgets
│   ├── custom_nav_bar.dart       # Bottom navigation bar
│   ├── loading_indicator.dart    # Loading indicators
│   └── textField/                # Custom text fields
│
├── main.dart                     # App entry point
└── main_bottom_nav_screen.dart   # Main navigation screen
```

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:
- **Flutter SDK**: Version 3.9.2 or higher
- **Dart SDK**: Included with Flutter
- **Android Studio** or **VS Code** with Flutter extensions
- **Android SDK** (for Android development)
- **Xcode** (for iOS development, macOS only)
- **Git** for version control

### System Requirements
- **Windows**: Windows 10 or later
- **macOS**: macOS 10.14 or later (for iOS development)
- **Linux**: Any modern Linux distribution

## 📦 Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd Bibble-Journey
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Verify Flutter setup**
   ```bash
   flutter doctor
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## ⚙️ Configuration

### API Configuration

The app connects to a backend API. Update the base URL in `lib/app/Urls.dart`:

```dart
static const String _baseUrl = "https://test3.fireai.agency";
```

For local development, you can use:
```dart
static const String _baseUrl = "http://10.0.2.2:8000"; // Android emulator
// or
static const String _baseUrl = "http://localhost:8000"; // iOS simulator
```

### Deep Linking

The app supports deep linking with the scheme `biblejourney://`. Configure deep links in:

- **Android**: `android/app/src/main/AndroidManifest.xml`
- **iOS**: `ios/Runner/Info.plist`

Example deep link: `biblejourney://payment-success?order_id=123`

### App Icons

App icons are configured in `pubspec.yaml`:
```yaml
flutter_icons:
  android: true
  ios: true
  image_path: "assets/images/image2.png"
```

Generate icons using:
```bash
flutter pub run flutter_launcher_icons
```

## 🏗️ Architecture

### Architecture Pattern
The project follows a **feature-based architecture** with clear separation of concerns:

1. **Features**: Each feature is self-contained with its own:
    - Models (data structures)
    - Services (API calls)
    - Screens (UI)
    - Widgets (reusable components)
    - Providers (state management, where applicable)

2. **Core**: Shared functionality across features:
    - Core services (authentication, API, storage)
    - Shared models
    - Utility functions

3. **App Layer**: Application-level configuration:
    - Routing
    - Constants
    - App-wide settings

### State Management
- **StatefulWidget**: Used for local component state
- **Providers**: Used for feature-level state management (devotions, quizzes, reflections)
- **Shared Preferences**: For persistent local storage (tokens, user data)

### API Integration
- **HTTP Client**: Uses `http` package for API calls
- **Service Layer**: Each feature has dedicated API services
- **Error Handling**: Try-catch blocks with user-friendly error messages
- **Token Management**: Bearer token authentication stored securely

## 🔑 Key Features Breakdown

### Authentication Flow
1. **Splash Screen** → Check authentication status
2. **Login/Signup** → User authentication
3. **OTP Verification** → For password reset
4. **Main App** → Navigate to home after authentication

### Navigation Structure
```
MainBottomNavScreen (Bottom Navigation)
├── Home Screen
│   ├── Daily Prayer
│   ├── Daily Devotion
│   ├── Today's Actions
│   └── Notifications
├── Bible Screen
│   ├── Old Testament
│   ├── New Testament
│   └── Chapter View
├── Journey Screen
│   ├── Journey List
│   ├── Journey Details
│   └── Daily Journey Steps
└── Profile Screen
    ├── Profile Details
    ├── Edit Profile
    ├── Subscription
    ├── Settings
    └── Help & Support
```

### Data Flow
1. **User Action** → UI triggers service call
2. **Service Layer** → Makes HTTP request to API
3. **API Response** → Service processes and returns data
4. **State Update** → UI updates with new data
5. **Local Storage** → Important data cached locally

## 🌐 API Integration

### Base URL
```
https://test3.fireai.agency
```

### Key Endpoints

#### Authentication
- `POST /api/auth/signup/` - User registration
- `POST /api/auth/login/` - User login
- `POST /api/auth/logout/` - User logout
- `POST /api/forgot/password/` - Request password reset
- `POST /api/auth/otp/verify/` - Verify OTP
- `POST /api/reset/password/` - Reset password

#### User Profile
- `GET /api/profile/` - Get user profile
- `PUT /api/profile/` - Update profile
- `POST /api/change/password/` - Change password
- `POST /api/account/disable/` - Deactivate account

#### Journeys
- `GET /journey/all_journy/` - Get all journeys
- `GET /progress/journey/{journeyId}` - Get journey details
- `GET /progress/steps/{journeyId}/{dayId}` - Get journey step content
- `POST /progress/stepcopmplete/` - Mark step as complete

#### Daily Content
- `GET /progress/today/prayer` - Get today's prayer

#### Payment
- `POST /api/pay/` - Process payment

#### Questionnaire
- `POST /api/user/categorize/` - Submit questionnaire answers

### Authentication
All authenticated endpoints require a Bearer token in the Authorization header:
```
Authorization: Bearer <token>
```

## 🌍 Localization

The app supports 6 languages with easy localization:

### Supported Languages
- 🇬🇧 English (en) - Default
- 🇫🇷 French (fr)
- 🇩🇪 German (de)
- 🇮🇹 Italian (it)
- 🇵🇹 Portuguese (pt)
- 🇪🇸 Spanish (es)

### Adding Translations
1. Add translation keys to all language files in `lib/localization/`
2. Use translations in code:
   ```dart
   Text("home".tr())  // Uses current locale
   ```

### Changing Language
Users can change language from Profile → Language Settings

## 📱 Platform Support

### Android
- **Minimum SDK**: Configured in `android/app/build.gradle.kts`
- **Target SDK**: Latest Android version
- **Permissions**: Internet, storage (for images), audio (for prayers)

### iOS
- **Minimum Version**: Configured in `ios/Podfile`
- **Permissions**: Camera, photo library, microphone (if needed)

## 💻 Development

### Running the App

**Debug Mode:**
```bash
flutter run
```

**Release Mode:**
```bash
flutter run --release
```

**Specific Device:**
```bash
flutter run -d <device-id>
```

### Code Structure Guidelines

1. **Feature Modules**: Keep features self-contained
2. **Naming Conventions**:
    - Screens: `*_screen.dart`
    - Widgets: `*_widget.dart` or descriptive names
    - Services: `*_service.dart` or `*_api.dart`
    - Models: `*_model.dart`

3. **File Organization**: Group related files in feature folders

4. **Constants**: Use `AppColors`, `AppTextStyles`, `AppSizes` from `constants.dart`

### Debugging

**Enable Debug Mode:**
- Debug banner is disabled in `app.dart`
- Use `debugPrint()` for logging
- Flutter DevTools for performance profiling

**Device Preview:**
Device preview is commented out in `main.dart`. To enable:
```dart
DevicePreview(enabled: true, ...)
```

## 🏗️ Building for Production

### Android

1. **Generate Keystore** (first time only):
   ```bash
   keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```

2. **Configure Signing**: Add keystore details to `android/key.properties`

3. **Build APK**:
   ```bash
   flutter build apk --release
   ```

4. **Build App Bundle**:
   ```bash
   flutter build appbundle --release
   ```

### iOS

1. **Configure Signing**: Set up in Xcode
2. **Build**:
   ```bash
   flutter build ios --release
   ```
3. **Archive**: Use Xcode to create archive and upload to App Store

## 🧪 Testing

Run tests:
```bash
flutter test
```

The project includes a basic widget test in `test/widget_test.dart`.

## 📝 Environment Variables

For sensitive data (API keys, etc.), consider using:
- `flutter_dotenv` package
- Environment-specific configuration files
- Secure storage for tokens (already implemented)

## 🔒 Security Considerations

1. **Token Storage**: Tokens stored securely using `shared_preferences`
2. **HTTPS**: All API calls use HTTPS
3. **Input Validation**: Validate user inputs on client side
4. **Password Security**: Passwords handled securely (never logged)
5. **Deep Links**: Validate deep link parameters

## 🐛 Troubleshooting

### Common Issues

1. **Build Errors**:
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

2. **Localization Not Working**:
    - Ensure all JSON files are in `lib/localization/`
    - Check locale initialization in `main.dart`

3. **API Connection Issues**:
    - Verify base URL in `Urls.dart`
    - Check network permissions
    - Verify API server is running

4. **iOS Build Issues**:
   ```bash
   cd ios
   pod install
   cd ..
   flutter run
   ```

## 📚 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [Easy Localization](https://pub.dev/packages/easy_localization)
- [HTTP Package](https://pub.dev/packages/http)

### Code Style
- Follow Flutter/Dart style guidelines
- Use meaningful variable and function names
- Add comments for complex logic
- Keep functions focused and small

## 👥 Team & Support

For support, questions, or contributions, please contact the development team.shanto8@gmail.com

**Built with using Flutter**

For more information, visit the [Flutter website](https://flutter.dev/).
