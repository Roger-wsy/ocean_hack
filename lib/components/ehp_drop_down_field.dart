import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpDropDownField extends StatefulWidget {
  EhpDropDownField({
    Key? key,
    required this.name,
    this.placeHolder,
    required this.items,
    this.borderRadius,
    this.padding = EhpPadding.containerCenter,
    this.labelStyle = const TextStyle(color: ehpGray),
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.alignLabelWithHint = false,
    this.initialValue,
    this.title,
  }) : super(key: key);

  String? placeHolder;
  List<DropdownMenuItem<String>> items;
  double? borderRadius;
  EdgeInsets padding;
  TextInputType? keyboardType;
  TextStyle? labelStyle;
  Function(String?)? onChanged;
  String? name;
  String? Function(String?)? validator;
  bool enabled;
  bool alignLabelWithHint;
  String? initialValue;
  String? title;

  @override
  State<EhpDropDownField> createState() => _EhpDropDownFieldState();
}

class _EhpDropDownFieldState extends State<EhpDropDownField> {
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
            child: FormBuilderDropdown(
              initialValue: widget.initialValue,
              name: widget.name ?? '',
              onChanged: widget.onChanged,
              enabled: widget.enabled,
              focusNode: focusNode,
              validator: widget.validator,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                alignLabelWithHint: widget.alignLabelWithHint,
                labelText: widget.placeHolder,
                labelStyle: widget.labelStyle,
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: 1.0),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: 1.0),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: 1.0),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
              items: widget.items,
            ),
          ),
        ],
      ),
    );
  }
}
