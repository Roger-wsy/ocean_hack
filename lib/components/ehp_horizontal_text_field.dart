import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpHorizontalTextField extends StatefulWidget {
  EhpHorizontalTextField({
    super.key,
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
    this.textAlign = TextAlign.end,
    this.showSeperator = true,
  });

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
  bool showSeperator;

  @override
  State<EhpHorizontalTextField> createState() => _EhpHorizontalTextFieldState();
}

class _EhpHorizontalTextFieldState extends State<EhpHorizontalTextField> {
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
    return Column(
      children: [
        Padding(
          padding: EhpPadding.containerCenter,
          child: Row(
            children: [
              EhpText(
                widget.title,
                padding: EhpPadding.r8,
              ),
              Expanded(
                child: FormBuilderTextField(
                  onTapOutside: (_) {
                    focusNode.unfocus();
                  },
                  initialValue: widget.initialValue,
                  name: widget.name ?? '',
                  textAlign: widget.textAlign,
                  obscureText: widget.obscureText,
                  inputFormatters: widget.inputFormatters,
                  // controller: textEditingController,
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
                    hintText: widget.placeHolder,
                    hintStyle: EhpTextStyle.labelText,
                    isDense: true,
                    contentPadding: EhpPadding.zero,
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.showSeperator)
          const Divider(
            color: ehpGray,
          ),
      ],
    );
  }
}
