import 'package:flutter/material.dart';
import 'package:new_project/core/color_manager.dart';
import 'package:new_project/core/style_manager.dart';

import 'font_manager.dart';

class TextStyleManager {
  // 1-appBar style
  static final TextStyle appBarStyle = boldFont(
    color: ColorManager.white,
    fontSized: FontSize.s20,
  );
  // 2-title style
  static final TextStyle titleStyle = boldFont(
    color: ColorManager.primary,
    fontSized: FontSize.s18,
  );
  // textfield label style
  static final TextStyle labelFieldStyle = mediumFont(
    color: ColorManager.primary,
    fontSized: FontSize.s18,
  );
  // textfield hint style
    static final TextStyle hintFieldStyle = regularFont(
    color: ColorManager.primary,
    
    fontSized: FontSize.s16,
  );
//  error style
  static final TextStyle errorStyle = regularFont(
    color: ColorManager.error,
    fontSized: FontSize.s14,
  );
  // primary style  
    static final TextStyle primaryStyle = regularFont(
    color: ColorManager.primary,
    fontSized: FontSize.s16,
  );
}
