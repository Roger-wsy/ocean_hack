import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';

class EhpSearchBar extends StatefulWidget {
  const EhpSearchBar({
    super.key,
    required this.onSearchTextChanged,
    this.padding = EhpPadding.h16,
    this.trailingWidget,
  });

  final Function(String) onSearchTextChanged;
  final Widget? trailingWidget;
  final EdgeInsetsGeometry padding;

  @override
  State<EhpSearchBar> createState() => _EhpSearchBarState();
}

class _EhpSearchBarState extends State<EhpSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EhpPadding.a16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  EhpSizedBox.w8,
                  Expanded(
                    child: TextField(
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      onChanged: widget.onSearchTextChanged,
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Search...',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.trailingWidget != null) widget.trailingWidget!,
        ],
      ),
    );
  }
}
