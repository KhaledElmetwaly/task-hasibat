import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/core/text_style_manager.dart';
import 'package:new_project/core/values_manager.dart';

import 'color_manager.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final bool autoFocus;
  final int? max;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  final TextInputType type;
  final TextInputAction action;
  final BorderRadius? radius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Function()? onTab;
  final Color? enableBorderColor;
  final Color? focusBorderColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? textColor;
  final int? maxLength;
  final Function(String? value) validate;
  final FieldTypes fieldTypes;
  final Function()? onSubmit;
  final Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autoValidateMode;
  final String? fontFamily;
  final TextDirection? textDirection;
  final TextStyle? style;

  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    required this.fieldTypes,
    this.controller,
    this.focusNode,
    this.margin,
    this.autoFocus = false,
    this.contentPadding,
    this.inputFormatters,
    required this.type,
    this.onTab,
    this.style,
    this.radius,
    this.max,
    this.maxLength,
    this.suffixWidget,
    this.prefixWidget,
    this.textColor,
    this.fillColor,
    this.hintColor,
    this.prefixIcon,
    this.suffixIcon,
    this.onChange,
    this.textDirection,
    this.fontFamily,
    this.autoValidateMode,
    this.onSubmit,
    required this.action,
    this.enableBorderColor,
    this.focusBorderColor,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.all(AppMargin.mH1),
      child: Visibility(
        visible: fieldTypes == FieldTypes.clickable,
        replacement: buildFormFiled(),
        child: buildClickableView(),
      ),
    );
  }

  Widget buildClickableView() {
    return InkWell(
      onTap: onTab,
      child: AbsorbPointer(
        absorbing: true,
        child: buildFormFiled(),
      ),
    );
  }

  Widget buildFormFiled() {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      textInputAction: action,
      enableSuggestions: false,
      autocorrect: false,
      autofocus: autoFocus,
      focusNode: focusNode,
      textDirection: textDirection,
      autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters ??
          [
            if (maxLength != null)
              LengthLimitingTextInputFormatter(
                  maxLength), //n is maximum number of characters you want in textfield
          ],
      enabled: fieldTypes != FieldTypes.disable,
      autofillHints: getAutoFillHints(type),
      maxLines: fieldTypes == FieldTypes.chat
          ? null
          : fieldTypes == FieldTypes.rich
              ? max
              : 1,
      obscureText: fieldTypes == FieldTypes.password,
      readOnly: fieldTypes == FieldTypes.readonly,
      onEditingComplete: onSubmit,
      onChanged: onChange,
      validator: (value) => validate(value),
      style: style ?? TextStyleManager.labelFieldStyle,
      decoration: InputDecoration(
          focusColor: focusBorderColor ?? ColorManager.black,
          counterStyle: TextStyleManager.labelFieldStyle,
          errorBorder: OutlineInputBorder(
            borderRadius: radius ?? BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          labelText: label,
          hintText: hint,
          labelStyle: TextStyleManager.hintFieldStyle,
          hintStyle: TextStyleManager.hintFieldStyle.copyWith(
            color: hintColor ?? ColorManager.primary,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: radius ?? BorderRadius.circular(10),
            borderSide: BorderSide(
              color: enableBorderColor ?? ColorManager.primary,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: radius ?? BorderRadius.circular(10),
            borderSide: BorderSide(
              color: enableBorderColor ?? ColorManager.primary,
              width: 1,
            ),
          ),
          filled: true,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          fillColor: fillColor ?? ColorManager.white,
          contentPadding: contentPadding ??
              EdgeInsets.only(
                  // top: AppPadding.pH10,
                  bottom: AppPadding.pH30,
                  right: AppPadding.pW20),
          prefix: prefixWidget,
          suffix: suffixWidget,
          errorStyle: TextStyleManager.errorStyle),
    );
  }

  List<String> getAutoFillHints(TextInputType inputType) {
    if (inputType == TextInputType.emailAddress) {
      return [AutofillHints.email];
    } else if (inputType == TextInputType.datetime) {
      return [AutofillHints.birthday];
    } else if (inputType == TextInputType.phone) {
      return [AutofillHints.telephoneNumber];
    } else if (inputType == TextInputType.url) {
      return [AutofillHints.url];
    }
    return [AutofillHints.name, AutofillHints.username];
  }
}

enum FieldTypes { normal, clickable, readonly, chat, password, rich, disable }
