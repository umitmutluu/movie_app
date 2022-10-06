import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFormField extends TextFormField {

  CustomTextFormField(
      {Key? key,
         String? hintText,
        String? toolTipName,
        TextStyle? textStyle,
        int?maxLine,
        ValueChanged<String>? onChange,
        Color? colorCursor,
        bool? autoFocus,
        Widget? prefixIcon,
         TextEditingController? controller,
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
        isDense: false,hoverColor: Colors.transparent,fillColor: Colors.transparent,alignLabelWithHint: false,
        hintStyle: TextStyle(color: Color(0xFF888888), fontSize: 12),
        labelStyle: TextStyle(color: Color(0xFF888888), fontSize: 12),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        counterText: '',
      ),
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
  );
}
