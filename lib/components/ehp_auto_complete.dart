import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpAutoComplete extends StatefulWidget {
  const EhpAutoComplete({
    super.key,
    this.options = const [],
    this.onSuggestionSelected,
    this.onSaved,
    this.suggestionsBoxController,
    this.type = TextFieldType.bordered,
    this.title,
    this.padding = EhpPadding.containerCenter,
    this.leading,
    this.autoFocus = false,
    this.hintText,
    this.minCharsForSuggestions = 2,
    this.onSubmitted,
  });

  final List<String> options;
  final Function(String)? onSuggestionSelected;
  final Function(String?)? onSaved;
  final SuggestionsBoxController? suggestionsBoxController;
  final TextFieldType type;
  final String? title;
  final EdgeInsets padding;
  final Widget? leading;
  final bool autoFocus;
  final String? hintText;
  final int? minCharsForSuggestions;
  final Function(String)? onSubmitted;

  @override
  State<EhpAutoComplete> createState() => _EhpAutoCompleteState();
}

class _EhpAutoCompleteState extends State<EhpAutoComplete> {
  late SuggestionsBoxController suggestionBoxController;
  late TextEditingController _typeAheadController;
  late FocusNode _focusNode;

  Color borderColor = ehpGray;

  @override
  void initState() {
    super.initState();
    suggestionBoxController =
        widget.suggestionsBoxController ?? SuggestionsBoxController();
    _focusNode = FocusNode();
    _typeAheadController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    suggestionBoxController.close();
    _focusNode.dispose();
    _typeAheadController.dispose();
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
            child: TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                onSubmitted: (val) {
                  if (widget.onSubmitted != null) {
                    widget.onSubmitted!(val);
                  }
                },
                onTapOutside: (event) {
                  _focusNode.unfocus();
                },
                autofocus: false,
                focusNode: _focusNode,
                cursorColor: Colors.black,
                cursorWidth: 1,
                decoration: InputDecoration(
                  prefixIcon: widget.leading,
                  hintText: widget.hintText,
                  labelStyle: const TextStyle(color: ehpGray),
                  contentPadding: EhpPadding.containerCenter,
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
                ),
                controller: _typeAheadController,
              ),
              minCharsForSuggestions: widget.minCharsForSuggestions ?? 2,
              suggestionsCallback: (pattern) => getSuggestions(pattern),
              itemBuilder: (context, suggestion) => Container(
                padding: EhpPadding.a16,
                color: Colors.white,
                child: EhpText(suggestion as String),
              ),
              itemSeparatorBuilder: (context, index) => EhpSeperator(
                type: EhpSeperatorType.line,
                lineColor: Theme.of(context).dividerColor,
              ),
              transitionBuilder: (context, suggestionsBox, controller) =>
                  suggestionsBox,
              onSuggestionSelected: (suggestion) {
                _typeAheadController.text = suggestion as String;
                if (widget.onSuggestionSelected != null) {
                  widget.onSuggestionSelected!(suggestion);
                }
              },
              hideOnEmpty: true,
              suggestionsBoxController: suggestionBoxController,
              validator: (value) => value!.isEmpty ? 'Cannot be blank' : null,
              onSaved: (value) {
                if (widget.onSaved != null) {
                  widget.onSaved!(value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  getBorderSide() {
    if (widget.type == TextFieldType.bordered) {
      return BorderSide(color: borderColor);
    }
    return BorderSide.none;
  }

  getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(widget.options);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
