import 'package:flutter/material.dart';

import '../../constants/colors_constants.dart';

class Carousel extends StatefulWidget {
  final List images;
   Carousel({super.key, 
  required this.images});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final PageController pageController = PageController();
  highLight(int index) {
    if (pageController.page == index) {
      return kMainColor;
    }
  }

  @override
  Widget build(BuildContext context) => Column(children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            itemCount: widget.images.length,
            itemBuilder: (context, index) => Image.network(
              widget.images[index],
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
            itemCount: widget.images.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => setState(() {
                pageController.jumpToPage(
                  index,
                );
              }),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 2,
                          color: pageController.page == index
                              ? kMainColor
                              : Colors.transparent)),
                  width: 80,
                  height: 80,
                  child: Image.network(widget.images[index])),
            ),
          ),
        ),
      ]);
}
