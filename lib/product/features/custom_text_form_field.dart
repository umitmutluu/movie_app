import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/size_helper.dart';

OutlineInputBorder _outlineInputBorder() {

  return  OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
    borderRadius: const BorderRadius.all(
      Radius.circular(8),
    ),
  );
}

class CustomTextFormField extends TextFormField {

  CustomTextFormField(
      {Key? key,
        required String hintText,
        String? toolTipName,
        TextStyle? textStyle,
        int?maxLine,
        Color? colorCursor,
        bool? autoFocus,
        Widget? prefixIcon,
        required TextEditingController controller,
        TextInputType? textInputType = TextInputType.text,
        int? maxLength,
        TextAlignVertical? textAlignVertical = TextAlignVertical.center})
      : super(key: key,textInputAction: TextInputAction.search,
    keyboardType: textInputType,cursorColor: colorCursor,
    maxLength: maxLength,maxLines: maxLine,autofocus: autoFocus??false?true:false,
    inputFormatters: <TextInputFormatter>[
      textInputType == TextInputType.number
          ? FilteringTextInputFormatter.digitsOnly
          : FilteringTextInputFormatter.singleLineFormatter,
    ],textAlignVertical: textAlignVertical??TextAlignVertical.center,
    decoration: InputDecoration(isDense: false,

        prefixIcon:prefixIcon ,prefixIconColor: Colors.grey,
        filled: true,
        fillColor: AppColor.instance!.lightWhite,
        hintText: hintText,
        errorBorder: _outlineInputBorder(),
        enabledBorder: _outlineInputBorder(),
        focusedBorder: _outlineInputBorder(),
        focusedErrorBorder: _outlineInputBorder()),
    controller: controller,
  );
}
