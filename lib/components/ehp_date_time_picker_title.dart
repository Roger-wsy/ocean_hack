import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:ocean_hack/constant/constant.dart';

class EhpDateTimePickerTitle extends StatefulWidget {
  EhpDateTimePickerTitle(
      {Key? key,
      @required this.name,
      this.placeHolder,
      this.suffixIcon,
      this.borderRadius,
      this.padding = EhpPadding.containerCenter7,
      this.keyboardType,
      this.obscureText = false,
      this.maxLines = 1,
      required this.onChanged,
      this.validator,
      this.enabled = true,
      this.firstDate,
      this.visible = true,
      this.initialEntryMode = DatePickerEntryMode.calendar,
      required this.titleName,
      required this.format,
      required this.inputType})
      : super(key: key);

  String? placeHolder;
  Icon? suffixIcon;
  double? borderRadius;
  EdgeInsets padding;
  Color? focusedBorderColor;
  TextInputType? keyboardType;
  bool obscureText;
  int? maxLines;
  Function? onChanged;
  String? name;
  String? Function(DateTime?)? validator;
  bool enabled;
  DateTime? firstDate;
  bool visible;
  String titleName;
  DatePickerEntryMode initialEntryMode;
  DateFormat format = DateFormat('dd MMM yyyy');
  InputType inputType = InputType.date;

  @override
  State<EhpDateTimePickerTitle> createState() => _EhpDateTimePickerTitleState();
}

class _EhpDateTimePickerTitleState extends State<EhpDateTimePickerTitle> {
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
    return Visibility(
      visible: widget.visible,
      child: Padding(
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
            FormBuilderDateTimePicker(
              firstDate: widget.firstDate,
              inputType: widget.inputType,
              name: widget.name ?? '',
              onChanged: ((value) => widget.onChanged!(value)),
              format: widget.format,
              enabled: widget.enabled,
              cursorColor: Colors.black,
              cursorWidth: 1,
              focusNode: focusNode,
              validator: widget.validator,
              initialEntryMode: widget.initialEntryMode,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                alignLabelWithHint: false,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(12)), // Updated border radius
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: const UnderlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(12)), // Updated border radius
                  borderSide: BorderSide.none,
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
                labelStyle: const TextStyle(
                  color: ehpGray,
                ),
                hintText: widget.placeHolder,
                hintStyle: const TextStyle(
                  color: ehpGray,
                ),
                fillColor: ehpSecondaryColor,
                filled: true,
                suffixIcon: widget.suffixIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
