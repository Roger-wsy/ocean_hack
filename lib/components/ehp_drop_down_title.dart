import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ocean_hack/constant/constant.dart';

class EhpDropDownTitle extends StatefulWidget {
  EhpDropDownTitle({
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
    required this.titleName,
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
  String titleName;

  @override
  State<EhpDropDownTitle> createState() => _EhpDropDownTitleState();
}

class _EhpDropDownTitleState extends State<EhpDropDownTitle> {
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
          Padding(
            padding: EhpPadding.a4,
            child: Text(
              widget.titleName,
              style: EhpTextStyle.b2,
            ),
          ),
          FormBuilderDropdown(
            initialValue: widget.initialValue,
            name: widget.name ?? '',
            onChanged: widget.onChanged,
            enabled: widget.enabled,
            focusNode: focusNode,
            validator: widget.validator,
            decoration: InputDecoration(
              alignLabelWithHint: widget.alignLabelWithHint,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: widget.placeHolder,
              labelStyle: widget.labelStyle,
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
              fillColor: Colors.white,
              filled: true,
            ),
            items: widget.items,
          ),
        ],
      ),
    );
  }
}
