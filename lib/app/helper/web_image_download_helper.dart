// ignore: avoid_web_libraries_in_flutter
/// Before compiling for iOS or Android, comment everything inside
/// the `downloadAPhotoOnDesktop()` function
///
import 'dart:developer';
//import 'dart:html' show AnchorElement; // <-  Comment this import too

/// uncomment only for [web app]
///
void downloadAPhotoOnWeb(String imageUrl) async {
  String url = imageUrl;
  log('Un-comment the in: lib/app/helper/web_image_download_helper.dart');
  
  // try {
  //   AnchorElement anchorElement = AnchorElement(href: url);
  //   anchorElement.download = "flutter_logo";
  //   anchorElement.click();
  // } catch (e) {
  //   print(e);
  // }
}
