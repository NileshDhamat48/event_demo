import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double width;
  final double height;
  final String placeholderUrl;

  const CommonNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width = double.infinity,
    this.height = double.infinity,
    this.placeholderUrl =
        'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl.isNotEmpty ? imageUrl : placeholderUrl,
      fit: fit,
      width: width,
      height: height,
      progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
          placeholderUrl,
          fit: fit,
          width: width,
          height: height,
        ),
      ),
      errorWidget: (context, url, error) => Image.network(
        placeholderUrl,
        fit: fit,
        width: width,
        height: height,
      ),
    );
  }
}
