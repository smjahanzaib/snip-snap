import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/image_model.dart';
import 'package:SnipSnap/data/models/photo_model.dart';
import 'package:SnipSnap/utils/app_cache_manager.dart';
import 'package:SnipSnap/utils/text_style.dart';

class PhotoViewScreen extends StatefulWidget {
  const PhotoViewScreen({
    Key key,
    this.params,
  }) : super(key: key);

  final Map<String, dynamic> params;

  @override
  _PhotoViewScreenState createState() => _PhotoViewScreenState();
}

class _PhotoViewScreenState extends State<PhotoViewScreen> {
  PageController pageController;
  int selectedIndex;
  List<PhotoModel> photos;

  @override
  void initState() {
    super.initState();

    selectedIndex = widget.params['selectedIndex'] as int ?? 0;
    photos = widget.params['photos'] as List<PhotoModel> ?? <PhotoModel>[];

    pageController = PageController(initialPage: selectedIndex);
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    return PhotoViewGalleryPageOptions(
      imageProvider: CachedNetworkImageProvider(
        photos[index].getImageURL(ImageSize.view),
        cacheManager: AppCacheManager(),
      ),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * 0.8,
      maxScale: PhotoViewComputedScale.covered * 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: _buildItem,
            itemCount: photos.length,
            pageController: pageController,
            onPageChanged: (int index) {
              setState(() => selectedIndex = index);
            },
            scrollDirection: Axis.horizontal,
            enableRotation: true,
          ),
          Container(
            padding: const EdgeInsets.all(kPaddingL),
            child: Text(
              '${selectedIndex + 1} / ${photos.length}',
              style: Theme.of(context).textTheme.subtitle2.white.w500,
            ),
          )
        ],
      ),
    );
  }
}
