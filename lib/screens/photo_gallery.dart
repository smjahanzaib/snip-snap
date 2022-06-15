import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/image_model.dart';
import 'package:SnipSnap/data/models/photo_model.dart';
import 'package:SnipSnap/utils/app_cache_manager.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({Key key, this.params}) : super(key: key);

  final Map<String, dynamic> params;

  @override
  _PhotoGalleryScreenState createState() {
    return _PhotoGalleryScreenState();
  }
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  final SwiperController _controller = SwiperController();
  final ScrollController _listController = ScrollController();

  List<PhotoModel> _photos;
  String _partnerName;

  int _index = 0;

  @override
  void initState() {
    _photos = widget.params['photos'] as List<PhotoModel> ?? <PhotoModel>[];
    _partnerName = widget.params['name'] as String ?? '';

    super.initState();
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
      body: SafeArea(
        top: false,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Swiper(
                controller: _controller,
                onIndexChanged: (int index) => setState(() => _index = index),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.locationGalleryView,
                      arguments: <String, dynamic>{
                        'selectedIndex': index,
                        'photos': _photos,
                      },
                    ),
                    child: CachedNetworkImage(
                      cacheManager: AppCacheManager(),
                      imageUrl: _photos[index].getImageURL(ImageSize.view),
                      imageBuilder:
                          (BuildContext context, ImageProvider imageProvider) =>
                              Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      errorWidget:
                          (BuildContext context, String url, Object error) =>
                              const Icon(Icons.error),
                    ),
                  );
                },
                itemCount: _photos.length,
                pagination: const SwiperPagination(
                  alignment: Alignment(0.0, 0.9),
                  builder:
                      DotSwiperPaginationBuilder(activeColor: kPrimaryColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kPaddingM),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  StrutText(
                    _partnerName,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: kWhite),
                  ),
                  StrutText(
                    '${_index + 1}/${_photos.length}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: kWhite),
                  )
                ],
              ),
            ),
            Container(
              height: 70,
              margin: const EdgeInsets.only(bottom: kPaddingM),
              child: ListView.builder(
                controller: _listController,
                padding: const EdgeInsetsDirectional.only(end: kPaddingM),
                scrollDirection: Axis.horizontal,
                itemCount: _photos.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => _controller.move(index),
                    child: Container(
                      width: 70,
                      margin:
                          const EdgeInsetsDirectional.only(start: kPaddingM),
                      child: CachedNetworkImage(
                        cacheManager: AppCacheManager(),
                        imageUrl: _photos[index].getImageURL(ImageSize.view),
                        imageBuilder: (BuildContext context,
                                ImageProvider imageProvider) =>
                            Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: index == _index
                                  ? Theme.of(context).accentColor
                                  : Theme.of(context).dividerColor,
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(kBoxDecorationRadius)),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (BuildContext context, String url) =>
                            const CircularProgressIndicator(),
                        errorWidget:
                            (BuildContext context, String url, Object error) =>
                                const Icon(Icons.error),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
