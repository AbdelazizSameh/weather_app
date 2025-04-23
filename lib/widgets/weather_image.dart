import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  final String imageUrl;
  final double size;

  const WeatherImage({super.key, required this.imageUrl, this.size = 80});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl.startsWith('http') ? imageUrl : 'https:$imageUrl',
      width: size,
      height: size,
      fit: BoxFit.contain,
      placeholder: (context, url) => SizedBox(width: size, height: size),
      errorWidget:
          (context, url, error) =>
              Icon(Icons.cloud_off_outlined, size: size, color: Colors.grey),
    );
  }
}
