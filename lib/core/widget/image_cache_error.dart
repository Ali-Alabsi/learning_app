import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageNetworkCache extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final double? width;
  final double? height;
  const ImageNetworkCache({
    super.key, required this.url,this.fit, this.width, this.height
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url,
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
            // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
          ),
        ),
      ),
      placeholder: (context, url) => showLoadingImage(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}

showLoadingImage(){
  return SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey,
      child: SizedBox(),
    ),
  );
}