import '../helpers/size_config.dart';

const double screenWidthInDesign = 375.0;
const double screenHeightInDesign = 812.0;

extension ExtendedNumber on num {
  double get toScreenSize {
    return (this / screenWidthInDesign) * SizeConfig.screenWidth;
  }

  double get toScreenWidthHeight {
    double designRatio = screenWidthInDesign / screenHeightInDesign; // iphone 12 pro max
    return (this * designRatio) / SizeConfig.sizeRatio;
  }

  String get toNonZerosTrailingString {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    return toString().replaceAll(regex, '');
  }
}
