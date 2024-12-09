import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// https://pub.dev/packages/flutter_cache_manager
class ImagesScreen extends StatelessWidget {
  const ImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: 'http://via.placeholder.com/350x150',
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          CachedNetworkImage(
            imageUrl: 'http://via.placeholder.com/350x150',
            progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}
