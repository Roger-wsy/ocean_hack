import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';

class EhpCarouselImageList extends StatefulWidget {
  const EhpCarouselImageList({
    Key? key,
    this.carouselImageList = const [],
  }) : super(key: key);

  final List<dynamic> carouselImageList;

  @override
  State<EhpCarouselImageList> createState() => _EhpCarouselImageListState();
}

class _EhpCarouselImageListState extends State<EhpCarouselImageList> {
  late PageController _pageController;
  int activePage = 0;

  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EhpPadding.b4,
          child: SizedBox(
            height: 250,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.carouselImageList.length,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, index) {
                return Image.network(
                  widget.carouselImageList[index],
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
        ),
        if (widget.carouselImageList.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.carouselImageList.length,
              (index) => Padding(
                padding: EhpPadding.a2,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  width: index == activePage ? 20 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: index == activePage
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }
}
