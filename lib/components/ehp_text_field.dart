import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

enum TextFieldType { bordered, nonBordered }

class EhpTextField extends StatefulWidget {
  EhpTextField({
    Key? key,
    @required this.name,
    this.placeHolder,
    this.suffixIcon,
    this.borderRadius,
    this.padding = EhpPadding.containerCenter,
    this.labelStyle = const TextStyle(color: ehpGray),
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.validator,
    this.hideLabelWhenFocused = false,
    this.enabled = true,
    this.alignLabelWithHint = false,
    this.initialValue,
    this.inputFormatters,
    this.title,
    this.type = TextFieldType.nonBordered,
    this.textAlign = TextAlign.start,
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
  int? minLines;
  Function? onChanged;
  String? name;
  String? Function(String?)? validator;
  bool hideLabelWhenFocused;
  bool enabled;
  bool alignLabelWithHint;
  String? initialValue;
  List<TextInputFormatter>? inputFormatters;
  String? title;
  TextFieldType type;
  TextAlign textAlign;

  @override
  State<EhpTextField> createState() => _EhpTextFieldState();
}

class _EhpTextFieldState extends State<EhpTextField> {
  late FocusNode focusNode;
  Color borderColor = ehpGray;
  // late TextEditingController textEditingController;

  @override
  void initState() {
    focusNode = FocusNode();
    // textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // textEditingController.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            EhpText(
              widget.title,
              color: Colors.grey.shade600,
              padding: EhpPadding.v4,
            ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0),
                  blurRadius: 12.0,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: _buildTextField(),
          ),
        ],
      ),
    );
  }

  FormBuilderTextField _buildTextField() {
    return FormBuilderTextField(
      initialValue: widget.initialValue,
      name: widget.name ?? '',
      textAlign: widget.textAlign,
      obscureText: widget.obscureText,
      inputFormatters: widget.inputFormatters,
      // controller: textEditingController,
      onTapOutside: (_) {
        focusNode.unfocus();
      },
      onChanged: widget.onChanged == null
          ? (val) {}
          : (value) => widget.onChanged!(value),
      keyboardType: widget.keyboardType,
      enabled: widget.enabled,
      cursorColor: Colors.black,
      cursorWidth: 1,
      focusNode: focusNode,
      validator: widget.validator,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      minLines: widget.minLines,
      decoration: InputDecoration(
        contentPadding: EhpPadding.containerCenter,
        alignLabelWithHint: widget.alignLabelWithHint,
        floatingLabelBehavior: widget.hideLabelWhenFocused
            ? FloatingLabelBehavior.never
            : FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderSide: getBorderSide(),
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.red),
        ),
        labelText: widget.placeHolder,
        labelStyle: widget.labelStyle,
        enabledBorder: OutlineInputBorder(
          borderSide: getBorderSide(),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: getBorderSide(),
          borderRadius: BorderRadius.circular(12.0),
        ),
        fillColor: ehpSecondaryColor,
        filled: true,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }

  getBorderSide() {
    if (widget.type == TextFieldType.bordered) {
      return BorderSide(color: borderColor);
    }
    return BorderSide.none;
  }
}
