import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/widgets/my_widgets.dart';

class MyTextInputField extends StatefulWidget {
  const MyTextInputField(
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
        this.isPassword = false, this.isEnabled=false, this.inputFormatters, this.suffixIcon, this.autoValidateMode})
      : super(key: key);
  final String? hintText;
  final IconData? icon;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextAlign textAlign;
  final double? fontSize;
  final double? hintTextFontSize;
  final bool isEnabled;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final AutovalidateMode? autoValidateMode;

  @override
  State<MyTextInputField> createState() => _MyTextInputField();
}

class _MyTextInputField extends State<MyTextInputField> {
  bool _passwordVisible = true;
  _MyTextInputField(){
    _passwordVisible = true;
  }
  /*
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  /*  widget.controller?.addListener(
        (_updateText) /*{
      final String text = widget.controller.text;
      widget.controller.value = widget.controller.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );

    }*/
    );*/
  }*/
/*
  var myText;
  void _updateText() {
    setState(() {
      myText = widget.controller?.text;
    });
  }*/



  @override
  void dispose() {
      widget.controller?.dispose();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: widget.autoValidateMode,
      inputFormatters: widget.inputFormatters,
      autofocus: false,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPassword,
      obscuringCharacter: '*',
      validator: widget.validator,
      controller: widget.controller,
      onSaved: (value) {
        widget.controller?.text = value!;
      },
      cursorColor: AppColors.kPrimaryColor,
      style: TextStyle(color: AppColors.kPrimaryColor,fontSize: widget.fontSize ?? null,),
      textAlign: widget.textAlign,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: AppColors.kPrimaryColor60),
        filled: true,
        fillColor: AppColors.kPrimaryColor10,
        suffixIcon: widget.suffixIcon,
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
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.kPrimaryColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.kPrimaryColor10,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.kPrimaryColor,
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.kPrimaryColor10, width: 1.0),
        ),
      ),
    );
  }
}


/*
class MyTextInputField extends StatefulWidget {
  const MyTextInputField(
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
        this.isPassword = false, this.isEnabled=false, this.labelText})
      : super(key: key);
  final String? hintText;
  final String? labelText;
  final IconData? icon;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextAlign textAlign;
  final double? fontSize;
  final double? hintTextFontSize;
  final bool isEnabled;

  @override
  State<MyTextInputField> createState() => _MyTextInputField();
}

class _MyTextInputField extends State<MyTextInputField> {
  late bool _passwordVisible = true;
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
    widget.controller?.addListener(
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
      myText = widget.controller?.text;
    });
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPassword,
      obscuringCharacter: '*',
      controller: widget.controller,
      onChanged: (value) {
        widget.controller?.text = value;
      },
      cursorColor: AppColors.kPrimaryColor,
      style: TextStyle(color: AppColors.kPrimaryColor,fontSize: widget.fontSize,),
      textAlign: widget.textAlign,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: AppColors.kPrimaryColor),
        errorStyle: TextStyle(color: AppColors.kPrimaryColor60),
        filled: true,
        fillColor: AppColors.kPrimaryColor10,
        suffixIcon: null,
        prefixIcon: widget.icon!=null?Icon(
          widget.icon,
          color: const Color(0xff80065d),
        ):null,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: AppColors.kPrimaryColor60,
          fontSize: widget.hintTextFontSize,
        ),
        helperStyle: const TextStyle(fontFamily: 'OpenSans'),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.kPrimaryColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColors.kPrimaryColor10,
            width: 0.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.kPrimaryColor,
            width: 2.0,
          ),
        ),
       /* border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.kPrimaryColor10, width: 1.0),
        ),*/
      ),
    );
  }
}
 */