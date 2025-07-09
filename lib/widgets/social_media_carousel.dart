// lib/widgets/social_media_carousel.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as cs; // ALIAS: Import carousel_slider with 'cs' alias
import 'package:truly_desi_app/app_constants.dart';
import 'package:truly_desi_app/theme/app_colors.dart';

class SocialMediaCarousel extends StatelessWidget {
  const SocialMediaCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return cs.CarouselSlider( // Use aliased CarouselSlider
      options: cs.CarouselOptions( // Use aliased CarouselOptions
        height: 250.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: AppConstants.instagramPosts.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppColors.lightGrey,
                    alignment: Alignment.center,
                    child: Icon(Icons.image, color: AppColors.grey.withOpacity(0.5)),
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}