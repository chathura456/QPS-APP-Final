import 'package:flutter/material.dart';
import 'package:qps_app/widgets/my_widgets.dart';

class RoundedInputField2 extends StatefulWidget {
  const RoundedInputField2(
      {Key? key,
      this.hintText,
      this.icon = Icons.person,
      required this.controller,
      this.validator,
      this.isPassword = false})
      : super(key: key);
  final String? hintText;
  final IconData icon;
  final TextEditingController controller;
  final FormFieldValidator? validator;
  final bool isPassword;

  @override
  State<RoundedInputField2> createState() => _RoundedInputField1State2();
}

class _RoundedInputField1State2 extends State<RoundedInputField2> {
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
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isPassword ? _passwordVisible : false,
      onSaved: (value) {
        widget.controller.text = value!;
      },
      cursorColor: AppColors.kPrimaryColor,
      style: const TextStyle(color: AppColors.kPrimaryColor),
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
        prefixIcon: Icon(
          widget.icon,
          color: const Color(0xff80065d),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: AppColors.kPrimaryColor60,
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

class RoundedPasswordField1 extends StatefulWidget {
  const RoundedPasswordField1(
      {Key? key, required this.controller, this.validator})
      : super(key: key);
  final TextEditingController controller;
  final FormFieldValidator? validator;

  @override
  State<RoundedPasswordField1> createState() => _RoundedPasswordField1State();
}

class _RoundedPasswordField1State extends State<RoundedPasswordField1> {
  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
    widget.controller.addListener(() {
      final String text = widget.controller.text.toLowerCase();
      widget.controller.value = widget.controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  late bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      autofocus: false,
      validator: widget.validator,
      controller: widget.controller,
      onSaved: (value) {
        widget.controller.text = value!;
      },
      onChanged: (value) {
        value = widget.controller.text;
      },
      style: const TextStyle(color: AppColors.kPrimaryColor),
      obscureText: _passwordVisible,
      cursorColor: AppColors.kPrimaryColor,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: AppColors.kPrimaryColor60),
        filled: true,
        fillColor: AppColors.kPrimaryColor10,
        prefixIcon: const Icon(
          Icons.lock,
          color: AppColors.kPrimaryColor,
        ),
        hintText: "Password",
        hintStyle: TextStyle(
          color: AppColors.kPrimaryColor60,
        ),
        helperStyle: const TextStyle(fontFamily: 'OpenSans'),
        suffixIcon: IconButton(
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
        ),

        /*
        suffixIcon: const Icon(
          Icons.visibility,
          color: Color(0xff80065d),
        ),
        */
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29.0),
          borderSide: const BorderSide(
            color: AppColors.kPrimaryColor,
            width: 2.0,
          ),
        ),
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29),
          borderSide: BorderSide(color: AppColors.kPrimaryColor10, width: 1.0),
        ),
      ),
    );
  }
}
