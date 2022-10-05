import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFormField extends TextFormField {

  CustomTextFormField(
      {Key? key,
        required String hintText,
        String? toolTipName,
        TextStyle? textStyle,
        int?maxLine,
        ValueChanged<String>? onChange,
        Color? colorCursor,
        bool? autoFocus,
        Widget? prefixIcon,
        required TextEditingController controller,
        TextInputType? textInputType = TextInputType.text,
        int? maxLength,
        TextAlignVertical? textAlignVertical = TextAlignVertical.center})
      : super(key: key, controller: controller,
      maxLength: 100,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      cursorWidth: 1,
      onChanged: onChange,
      cursorColor: const Color(0xFF888888),
      maxLines: 1,
      decoration: const InputDecoration(
        hintText: 'Query...',
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
            gapPadding: 8),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
            gapPadding: 8),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54),
            gapPadding: 8),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54,
            ),
            gapPadding: 8),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
            gapPadding: 8),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
            gapPadding: 8),
        hintStyle: TextStyle(color: Color(0xFF888888), fontSize: 12),
        labelStyle: TextStyle(color: Color(0xFF888888), fontSize: 12),
        counterText: '',
      ),
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
  );
}
