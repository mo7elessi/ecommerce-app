import 'package:bloc_state_managment/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboard;
  final Function validator;
  final String hint;
  final IconData? prefixIcon;
  final bool isPassword;
  final bool isClick;
  final IconData? suffixIcon;
  final Function? onTap;
  final Function? suffixIconPressed;
  final Function? onSubmit;
  final Function? onChanged;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.keyboard,
    required this.validator,
    required this.hint,
    this.prefixIcon,
    this.isPassword = false,
    this.isClick = true,
    this.suffixIcon,
    this.onTap,
    this.suffixIconPressed,
    this.onSubmit,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: isPassword,
      enabled: isClick,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(prefixIcon),
        border: const OutlineInputBorder(),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: () => suffixIconPressed!(),
              )
            : null,
      ),
      onTap: () => onTap,
      validator: (value) => validator(value),
      onFieldSubmitted: (value) => onSubmit ?? (value),
      onChanged: (value) => onChanged ?? (value),
    );
  }
}
