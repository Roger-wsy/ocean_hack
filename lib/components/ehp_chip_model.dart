import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpChipModel extends StatefulWidget {
  const EhpChipModel({
    super.key,
    this.data = const {},
    this.labelColor = Colors.white,
    this.selectedColor = ehpPrimaryColor,
    this.sectionTitle = '',
    required this.onChange,
  });

  final Map<String, dynamic> data;
  final Function? onChange;
  final Color? labelColor;
  final Color? selectedColor;
  final String? sectionTitle;

  @override
  State<EhpChipModel> createState() => _EhpChipModelState();
}

class _EhpChipModelState extends State<EhpChipModel> {
  int selectedIndex = 0;
  int selectedSectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.data.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, sectionIndex) {
          String sectionTitle = widget.data.keys.elementAt(sectionIndex);
          List<dynamic> options = widget.data[sectionTitle] ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (sectionTitle != '')
                EhpText(
                  sectionTitle,
                  textStyle: EhpTextStyle.b4,
                  padding: EhpPadding.containerCenter4,
                ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(options.length, (index) {
                    return Padding(
                      padding: index == 0 ? EhpPadding.l16 : EhpPadding.l4,
                      child: ChoiceChip(
                        selectedColor: widget.selectedColor,
                        label: EhpText(
                          options[index],
                          color: isSelected(sectionIndex, index)
                              ? widget.labelColor
                              : Colors.black,
                        ),
                        backgroundColor: Colors.white,
                        elevation: 1,
                        selected: isSelected(sectionIndex, index),
                        onSelected: (_) => setState(() {
                          selectedIndex = index;
                          selectedSectionIndex = sectionIndex;
                          widget.onChange!(selectedSectionIndex, selectedIndex);
                        }),
                      ),
                    );
                  }),
                ),
              ),
            ],
          );
        });
  }

  bool isSelected(int currentSectionIndex, int index) {
    return selectedIndex == index &&
        selectedSectionIndex == currentSectionIndex;
  }
}
