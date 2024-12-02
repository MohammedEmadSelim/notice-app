import 'package:factory_method_pattern_with_clean_architecture/core/responsive/responsive.dart';

extension SizeExtension on num {
  double get w => ResponsiveService.scaleWidth() * this;

  double get h => ResponsiveService.scaleHeight() * this;

  double get r => ResponsiveService.scaleRadius() * this;

  double get sp => ResponsiveService.scaleText() * this;
}
