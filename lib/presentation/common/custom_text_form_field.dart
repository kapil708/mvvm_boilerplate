import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_boilerplate/core/theme/app_css.dart';
import 'package:mvvm_boilerplate/core/utils/textstyle_extensions.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? hint;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final int? errorMaxLines;
  final double? radius;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? prefixIconPadding;
  final Widget? suffixIcon;
  final Widget? suffix;
  final EdgeInsetsGeometry? suffixIconPadding;
  final TextStyle? style, counterStyle, errorStyle;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? padding;
  final Color? fillColor;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final int? maxLength;
  final bool showCounter;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final bool showBoarder;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isDense;
  final bool autofocus;
  final InputBorder? inputBorder;
  final AutovalidateMode? autoValidateMode;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.initialValue,
    this.hint,
    this.hintText,
    this.labelText,
    this.errorText,
    this.errorMaxLines,
    this.radius,
    this.prefixIcon,
    this.prefixIconPadding,
    this.suffix,
    this.suffixIcon,
    this.suffixIconPadding,
    this.style,
    this.counterStyle,
    this.errorStyle,
    this.obscureText = false,
    this.validator,
    this.padding,
    this.fillColor,
    this.maxLines = 1,
    this.minLines = 1,
    this.keyboardType,
    this.enabled = true,
    this.maxLength,
    this.showCounter = false,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.showBoarder = true,
    this.textAlignVertical = TextAlignVertical.center,
    this.textAlign = TextAlign.start,
    this.focusNode,
    this.textInputAction,
    this.inputFormatters,
    this.isDense,
    this.autofocus = false,
    this.inputBorder,
    this.autoValidateMode,
    this.textCapitalization = TextCapitalization.sentences,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 6),
      borderSide: BorderSide(
        width: 1,
        color: colorScheme.outline,
        style: showBoarder ? BorderStyle.solid : BorderStyle.none,
      ),
    );

    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      style: (style ?? AppCss.bodyXXL),
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: maxLines,
      minLines: minLines,
      enabled: enabled,
      maxLength: maxLength,
      onTap: onTap,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      focusNode: focusNode,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      autofocus: autofocus,
      autovalidateMode: autoValidateMode,
      textCapitalization: textCapitalization,
      // expands: true,
      decoration: InputDecoration(
        enabledBorder: inputBorder,
        disabledBorder: inputBorder,
        border: inputBorder,
        focusedBorder: inputBorder,
        // constraints: const BoxConstraints(maxHeight: 100, minHeight: 100),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 6),
          borderSide: BorderSide(
            width: 1,
            color: colorScheme.error,
            style: showBoarder ? BorderStyle.solid : BorderStyle.none,
          ),
        ),
        focusedErrorBorder: inputBorder,
        errorStyle: (errorStyle ?? style ?? AppCss.bodyLarge).textColor(colorScheme.error),
        filled: true,
        fillColor: fillColor ?? colorScheme.surfaceVariant,
        contentPadding: padding ?? EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        hintText: hintText,
        hintStyle: (style ?? AppCss.bodyXXL).copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        labelText: labelText,
        errorText: errorText,
        errorMaxLines: errorMaxLines ?? 2,
        counterText: showCounter ? null : '',
        counterStyle: counterStyle ?? AppCss.bodyLarge,
        isDense: isDense,
        prefixIcon: prefixIcon != null ? Padding(padding: prefixIconPadding ?? EdgeInsets.symmetric(horizontal: 12, vertical: 14), child: prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Padding(padding: suffixIconPadding ?? const EdgeInsets.symmetric(horizontal: 0), child: suffixIcon) : null,
        suffix: suffix,
      ),
      autofillHints: autofillHints,
    );
  }
}
