import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyBanner {
  final List<String> images = [
     'https://e7.pngegg.com/pngimages/982/544/png-clipart-news-graphy-logo-icon-news-logo-text-photography.png',
     'https://w7.pngwing.com/pngs/499/171/png-transparent-newspaper-news-media-newsletter-nozzle-propeller-text-media-news-thumbnail.png',
     'https://e7.pngegg.com/pngimages/960/446/png-clipart-broadcasting-news-media-television-interview-miscellaneous-photography-thumbnail.png'
  ];
  showBanner() {
    return
    CarouselSlider(
      items: images.map((imagePath) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:NetworkImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 350.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 1.0,
      ),
    );
  }
}
