import 'package:flutter/material.dart';
import 'package:kwik_kenya/core/app_fonts.dart';
import 'package:kwik_kenya/core/colors.dart';

class TamplateCustomTextField extends StatefulWidget {
  final Function onChange;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? initialValue;
  final Color? fillColor;
  final TextStyle? textStyle;
  const TamplateCustomTextField({
    super.key,
    required this.onChange,
    this.hintText,
    this.keyboardType,
    this.initialValue,
    this.fillColor,
    this.textStyle,
  });

  @override
  State<TamplateCustomTextField> createState() =>
      _TamplateCustomTextFieldState();
}

class _TamplateCustomTextFieldState extends State<TamplateCustomTextField> {
  late FocusNode _focusNode;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _focusNode = FocusNode();
    _textEditingController = TextEditingController();
    if (widget.initialValue != null) {
      _textEditingController.text = widget.initialValue!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: _textEditingController,
      keyboardType: widget.keyboardType,
      style: AppFonts.bodyMedium.copyWith(color: AppColors.white),
      cursorColor: AppColors.white,
      onTapOutside: (event) {
        _focusNode.unfocus();
      },
      onChanged: (value) {
        widget.onChange(value);
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        fillColor: widget.fillColor ?? AppColors.primary,
        filled: true,
        hintText: widget.hintText,
        hintStyle:
            widget.textStyle ??
            AppFonts.bodyMedium.copyWith(color: Colors.white60),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.background),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}
