import 'package:flutter/material.dart';
import '/widgets/my_widgets.dart';

//common input field template used for all login and registration forms
class MyInputField extends StatefulWidget {
  const MyInputField(
      {Key? key,
      this.hintText,
        this.textAlign=TextAlign.left,
        this.hintTextFontSize,
        this.keyboardType=TextInputType.text,
        this.fontSize,
        this.textInputAction=TextInputAction.next,
      this.icon,
      required this.controller,
      this.validator,
      this.isPassword = false})
      : super(key: key);
  final String? hintText;
  final IconData? icon;
  final TextEditingController controller;
  final FormFieldValidator? validator;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextAlign textAlign;
  final double? fontSize;
  final double? hintTextFontSize;

  @override
  State<MyInputField> createState() => _MyInputField1State();
}

class _MyInputField1State extends State<MyInputField> {
  late bool _passwordVisible = true;
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
    widget.controller.addListener(
        (_updateText) /*{
      final String text = widget.controller.text;
      widget.controller.value = widget.controller.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );

    }*/
        );
  }

  var myText;
  void _updateText() {
    setState(() {
      myText = widget.controller.text;
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isPassword ? _passwordVisible : false,
      onSaved: (value) {
        widget.controller.text = value!;
      },
      cursorColor: AppColors.kPrimaryColor,
      style: TextStyle(color: AppColors.kPrimaryColor,fontSize: widget.fontSize ?? null,),
      textAlign: widget.textAlign,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: AppColors.kPrimaryColor60),
        filled: true,
        fillColor: AppColors.kPrimaryColor10,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xff80065d),
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
        prefixIcon: widget.icon!=null?Icon(
          widget.icon,
          color: const Color(0xff80065d),
        ):null,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: AppColors.kPrimaryColor60,
          fontSize: widget.hintTextFontSize ?? null,
        ),
        helperStyle: const TextStyle(fontFamily: 'OpenSans'),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29.0),
          borderSide: const BorderSide(
            color: AppColors.kPrimaryColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29.0),
          borderSide: BorderSide(
            color: AppColors.kPrimaryColor10,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29.0),
          borderSide: const BorderSide(
            color: AppColors.kPrimaryColor,
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29),
          borderSide: BorderSide(color: AppColors.kPrimaryColor10, width: 1.0),
        ),
      ),
    );
  }
}
