import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ocean_hack/constant/constant.dart';

class EhpTextFieldTitle extends StatefulWidget {
  EhpTextFieldTitle({
    Key? key,
    @required this.name,
    this.placeHolder,
    this.suffixIcon,
    this.borderRadius,
    this.padding = EhpPadding.containerCenter7,
    this.labelStyle = const TextStyle(color: ehpGray),
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    this.onChanged,
    this.validator,
    this.hideLabelWhenFocused = true,
    this.enabled = true,
    this.alignLabelWithHint = true,
    this.initialValue,
    this.titleName,
    this.onSubmitted,
    this.maxLength,
  }) : super(key: key);

  String? placeHolder;
  IconButton? suffixIcon;
  double? borderRadius;
  EdgeInsets padding;
  Color? focusedBorderColor;
  TextInputType? keyboardType;
  TextStyle? labelStyle;
  bool obscureText;
  int? maxLines;
  Function? onChanged;
  String? name;
  String? Function(String?)? validator;
  bool hideLabelWhenFocused;
  bool enabled;
  bool alignLabelWithHint;
  String? initialValue;
  String? titleName;
  int? maxLength;
  Function(String?)? onSubmitted;

  @override
  State<EhpTextFieldTitle> createState() => _EhpTextFieldTitleState();
}

class _EhpTextFieldTitleState extends State<EhpTextFieldTitle> {
  late FocusNode focusNode;
  Color borderColor = ehpGray;

  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.titleName != null)
            Padding(
              padding: EhpPadding.v2,
              child: Text(
                widget.titleName ?? '',
                style: EhpTextStyle.b2,
              ),
            ),
          FormBuilderTextField(
            initialValue: widget.initialValue,
            name: widget.name ?? '',
            obscureText: widget.obscureText,
            onChanged: (value) => widget.onChanged!(value),
            keyboardType: widget.keyboardType,
            enabled: widget.enabled,
            cursorColor: Colors.black,
            cursorWidth: 1,
            focusNode: focusNode,
            onSubmitted: widget.onSubmitted,
            validator: widget.validator,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              alignLabelWithHint: widget.alignLabelWithHint,
              floatingLabelBehavior: widget.hideLabelWhenFocused
                  ? FloatingLabelBehavior.never
                  : FloatingLabelBehavior.auto,
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(12)), // Updated border radius
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(12)), // Updated border radius
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ehpGray, // Updated border color
                ),
                borderRadius:
                    BorderRadius.circular(12.0), // Updated border radius
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ehpGray, // Updated border color
                ),
                borderRadius:
                    BorderRadius.circular(12.0), // Updated border radius
              ),
              labelText: widget.placeHolder,
              labelStyle: widget.labelStyle,
              hintText: widget.placeHolder,
              hintStyle: widget.labelStyle,
              fillColor: ehpSecondaryColor,
              filled: true,
              suffixIcon: widget.suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
