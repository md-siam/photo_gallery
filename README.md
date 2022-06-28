<img src="screenshots/badges/built-with-love.svg" height="28px"/>&nbsp;&nbsp;
<img src="screenshots/badges/flutter-dart.svg" height="28px" />&nbsp;&nbsp;
<a href="https://choosealicense.com/licenses/mit/" target="_blank"><img src="screenshots/badges/license-MIT.svg" height="28px" /></a>&nbsp;&nbsp;
<img src="screenshots/badges/Flutter-3.svg" height="28px" />&nbsp;&nbsp;
<img src="screenshots/badges/dart-null_safety-blue.svg" height="28px"/>
<img align="right" src="screenshots/store_icons/playstore_new.png" height="170"></img>

# Photo Gallery

<p align="justify" > 
In this assignment, you are required to create a simple Android / iOS / Flutter / React Native app that displays a list of photos as a gallery. Users can tap the photo to see a full-screen view of it with the possibility to zoom in and out.
</p>

```
Requirements:
    1. Use Unsplash API Documentation | List of Photos to get a list of photos and build a
        gallery of photos
    2. The user can tap the photo and can see a full-screen view of the photo
    3. The user has an infinite scroll on the gallery screen

User Interface (UI)
    Part of this challenge is to design the UI for this app.
    You are free to create the UI as you see fit as long as the app meets the requirements.

Extra credits
    You are encouraged to extend this project and add features as you see fit.
    Our suggestion is that these extensions should add to, not subtract from, the user's
    experience.
    1. Unit tests
    2. The app’s flavor/scheme can be changed easily so that changing from development API
        to production API becomes trivial
    3. Cache images
    4. Cache API response
    5. Allow saving photos in JPEG format to the local gallery
    6. Allow sharing the photo
```

## Resources Used

UI from [Dribbble](https://dribbble.com):

```
https://dribbble.com/shots/17309162-Photo-Gallery-App
```

Fonts from [Google Fonts](https://fonts.google.com):

```
Comfortaa: https://fonts.google.com/specimen/Comfortaa
Quicksand: https://fonts.google.com/specimen/Quicksand
```

Packages from [pub.dev](https://pub.dev/):

```
# For API calls & image downloading
  dio: ^4.0.6
# For state management
  provider: ^6.0.3
# For finding commonly used filesystem locations
  path_provider: ^2.0.10
# For animated text
  animated_text_kit: ^4.2.2
# For various grid layouts
  flutter_staggered_grid_view: ^0.6.1
# For using new collection of icons
  icofont_flutter: ^1.4.0
# For saving images and videos in gallery
  gallery_saver: ^2.3.2
# For sharing contents from Flutter app
  share_plus: ^4.0.6
# For image caching & keeping them in cache directory
  cached_network_image: ^3.2.1
# For managing network cached files
  flutter_cache_manager: ^3.3.0
# For using the blur hash from unsplash API
  flutter_blurhash: ^0.7.0
```

## Features & Implementations

<table align="center" style="margin: 0px auto;">
  <tr>
    <th align="center">Features</th>
    <th align="center">Implementations</th>
    <th align="center">Why?</th>
  </tr>
  <tr>
    <td>Using Unsplash API for `Photos` list</td>
    <td align="center">✅ &nbsp;&nbsp; Done!</td>
    <td align="center">-</td>
  </tr>
  <tr>
    <td>Photo gallery UI</td>
    <td align="center">✅ &nbsp;&nbsp; Done!</td>
    <td align="center">-</td>
  </tr>
  <tr>
    <td>Full-screen photo view</td>
    <td align="center">✅ &nbsp;&nbsp; Done!</td>
    <td align="center">-</td>
  </tr>
  <tr>
    <td>Infinite scroll on the gallery screen</td>
    <td align="center">✅ &nbsp;&nbsp; Done!</td>
    <td align="center">-</td>
  </tr>
  <tr>
    <td>Optimized UI design</td>
    <td align="center">✅ &nbsp;&nbsp; Done!</td>
    <td align="center">-</td>
  </tr>
  <tr>
    <td>Cross-platform support<br>Support: iOS, Android & Web</td>
    <td align="center">✅ &nbsp;&nbsp; Done!</td>
    <td align="center">-</td>
  </tr>
  <tr>
    <td>Unit tests</td>
    <td align="center">❌ &nbsp;&nbsp; Not Done!</td>
    <td align="center">Not enough time.<br>Hence, left it for the SQA engineer.</td>
  </tr>
  <tr>
    <td>Cache images</td>
    <td align="center">✅ &nbsp;&nbsp; Done!</td>
    <td align="center">-</td>
  </tr>
  <tr>
    <td>Cache API response</td>
    <td align="center">✅ &nbsp;&nbsp; Done!</td>
    <td align="center">-</td>
  </tr>
  <tr>
    <td>Allow saving photos in JPEG format</td>
    <td align="center">✅ &nbsp;&nbsp; Done!</td>
    <td align="center">-</td>
  </tr>
  <tr>
    <td>Allow sharing the photo</td>
    <td align="center">✅ &nbsp;&nbsp; Done!</td>
    <td align="center">-</td>
  </tr>
  <tr>
    <td>Proper git commit message</td>
    <td align="center">✅ &nbsp;&nbsp; Done!</td>
    <td align="center">-</td>
  </tr>
  <tr>
    <td>Documentations in all the dart files</td>
    <td align="center">✅ &nbsp;&nbsp; Done!</td>
    <td align="center">-</td>
  </tr>
  <tr>
    <td>Production ready</td>
    <td align="center">😕 &nbsp;&nbsp; Not 100% ready!</td>
    <td>
    It requires:<br>
    ⓵&nbsp;&nbsp;Unit testing<br>
    ⓶&nbsp;&nbsp;Widget testing<br>
    ⓷&nbsp;&nbsp;Integration testing<br>
    ⓸&nbsp;&nbsp;More code refactoring</td>
  </tr>
</table>

## APK File & Web App Link

<p align="center">
    <a href="https://drive.google.com/file/d/1Kq4QDnCmo6MGl12CU5wLeSDYCr3N5LA1/view?usp=sharing" target="_blank"><img src="screenshots/download_apk/download.png" height="100" ></img></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="https://md-siam.github.io/photo_gallery_web/" target="_blank"><img src="screenshots/web_app/web_app.png" height="100" ></img></a>
</p>

## App Demo

<table align="center" style="margin: 0px auto;">
  <tr>
    <th>iOS Simulator</th>
    <th>Android Emulator</th>
  </tr>
  <tr>
    <td><img align="right" src="screenshots/gif/ios_simulator.gif" height="500"></img></td>
    <td><img align="right" src="screenshots/gif/android_emulator.gif" height="500"></img></td>
  </tr>
  </table>
  <br>
<table align="center" style="margin: 0px auto;">
  <tr>
    <th>Google Chrome</th>
  </tr>
  <tr>
    <td><img align="right" src="screenshots/gif/google_chrome.gif"></img></td>
  </tr>
  </table>

## File Pattern Inside The `lib` Folder

```
lib/
├── app/
│   ├── controllers/
│   │   └── dummy_controller.dart
│   ├── helper/
│   │   └── web_image_download_helper.dart
│   ├── layout/
│   │   └── responsive_layout.dart
│   ├── models/
│   │   ├── photo_model.dart
│   │   ├── profile_image_model.dart
│   │   ├── urls_model.dart
│   │   └── user_model.dart
│   ├── notifier/
│   │   └── fab_visibility_notifier.dart
│   ├── providers/
│   │   └── photo_provider.dart
│   ├── services/
│   │   └── get_multiple_photo_data.dart
│   ├── splash/
│   │   └── splash_view.dart
│   ├── static/
│   │   └── static_values.dart
│   └── views/
│       ├── desktop/
│       │   ├── desktop_gallery.dart
│       │   ├── desktop_interactive_view.dart
│       │   └── desktop_view.dart
│       ├── mobile/
│       │   ├── mobile_gallery.dart
│       │   ├── mobile_interactive_view.dart
│       │   └── mobile_view.dart
│       ├── tablet/
│       │   ├── tablet_gallery.dart
│       │   ├── tablet_interactive_view.dart
│       │   └── tablet_view.dart
│       ├── widgets/
│       │   ├── components/
│       │   │   ├── circular_button.dart
│       │   │   └── glass_box.dart
│       │   ├── animated_floating_action_button.dart
│       │   ├── app_bar.dart
│       │   ├── image_tile.dart
│       │   ├── interactive_viewer_image_tile.dart
│       │   ├── no_internet_connection.dart
│       │   ├── normal_floating_action_button.dart
│       │   └── widgets.dart
│       └── views.dart
├── generated_plugin_registrant.dart
└── main.dart
```
