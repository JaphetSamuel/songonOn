import 'dart:ui';

class ImageUtils {

  static bool isLandScape(Image) {
    return Image.height > Image.width;
  }
}