import '../_package_exports.dart';

class ScreenSize {
  static final ScreenSize _instance = ScreenSize._init();
  factory ScreenSize() {
    return _instance;
  }
  ScreenSize._init();

  late Size screenSize;


  double getHeightPercent(final double percent) {
    return screenSize.height * percent;
  }

  double getWidthPercent(final double percent) {
    return screenSize.width * percent;
  }

  set setScreenSize(final Size size) => screenSize = size;
}
