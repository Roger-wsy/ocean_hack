import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpDateTimePicker extends StatefulWidget {
  EhpDateTimePicker({
    Key? key,
    @required this.name,
    this.placeHolder,
    this.suffixIcon,
    this.title,
    this.borderRadius,
    this.padding = EhpPadding.containerCenter,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    required this.onChanged,
    this.validator,
    this.hideLabelWhenFocused = false,
    this.enabled = true,
    this.firstDate,
    this.visible = true,
    this.initialDate,
  }) : super(key: key);

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
  bool hideLabelWhenFocused;
  bool enabled;
  DateTime? firstDate;
  bool visible;
  DateTime? initialDate;
  String? title;

  @override
  State<EhpDateTimePicker> createState() => _EhpDateTimePickerState();
}

class _EhpDateTimePickerState extends State<EhpDateTimePicker> {
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
            if (widget.title != null)
              EhpText(
                'Please choose your desirable date',
                color: Colors.grey.shade600,
                padding: const EdgeInsets.fromLTRB(4, 0, 0, 8),
              ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 0),
                    blurRadius: 12.0,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: FormBuilderDateTimePicker(
                initialDate: widget.initialDate,
                firstDate: widget.firstDate,
                inputType: InputType.date,
                name: widget.name ?? '',
                onChanged: ((value) => widget.onChanged!(value)),
                format: DateFormat('dd MMM yyyy'),
                enabled: widget.enabled,
                cursorColor: Colors.black,
                cursorWidth: 1,
                focusNode: focusNode,
                validator: widget.validator,
                initialEntryMode: DatePickerEntryMode.calendar,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  floatingLabelBehavior: widget.hideLabelWhenFocused
                      ? FloatingLabelBehavior.never
                      : FloatingLabelBehavior.auto,
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedErrorBorder: const UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                  labelText: widget.placeHolder,
                  labelStyle: const TextStyle(color: ehpGray),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  fillColor: ehpSecondaryColor,
                  filled: true,
                  suffixIcon: widget.suffixIcon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
