import 'package:farmers_nest/model/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageSlider extends StatefulWidget {
  const HomePageSlider({super.key});

  @override
  State<HomePageSlider> createState() => _HomePageSliderState();
}

class _HomePageSliderState extends State<HomePageSlider> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [_buildSliderImage(), _buildSliderIndicator()]);
  }

  SizedBox _buildSliderIndicator() {
    return SizedBox(
      height: 30,
      child: Center(
        child: SmoothPageIndicator(
          controller: _pageController,
          count: ProductData.sliderData.length,
        ),
      ),
    );
  }

  SizedBox _buildSliderImage() {
    return SizedBox(
      height: 120,
      width: double.maxFinite,
      child: PageView(
        controller: _pageController,
        children:
            ProductData.sliderData
                .map(
                  (e) => Stack(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            e["image"],
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    Center(child: Icon(Icons.broken_image)),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 10,
                        child: Text(
                          e['message'],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
      ),
    );
  }
}
