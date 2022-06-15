import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/models/review_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/linear_percent_indicator.dart';
import 'package:SnipSnap/widgets/pull_to_refresh.dart';
import 'package:SnipSnap/widgets/review_list_item.dart';
import 'package:SnipSnap/widgets/star_rating.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:SnipSnap/widgets/title_with_subtitle.dart';
import 'package:SnipSnap/widgets/uppercase_title.dart';
import 'package:sprintf/sprintf.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({
    Key key,
    @required this.location,
  })  : assert(location != null),
        super(key: key);

  final LocationModel location;

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final RefreshController _controller =
      RefreshController(initialRefresh: false);

  /// Callback for footer [SmartRefresher].
  ///
  /// You should use [RefreshController] to end loading state.
  Future<void> _onLoading() async {
    await Future<int>.delayed(const Duration(seconds: 1));
    _controller.loadComplete();
  }

  /// Callback for header [SmartRefresher].
  ///
  /// You should use [RefreshController] to end loading state.
  Future<void> _onRefresh() async {
    await Future<int>.delayed(const Duration(seconds: 1));
    _controller.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        centerTitle: true,
        title: TitleWithSubtitle(
          title: L10n.of(context).locationTitleReviews,
          subtitle: widget.location.name,
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        // This is the component that provides drop-down refreshing and up loading.
        child: PullToRefresh(
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          controller: _controller,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kPaddingL),
                    child: StrutText(
                      widget.location.name,
                      style: Theme.of(context).textTheme.headline5.fs28.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: kPaddingL),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding:
                              const EdgeInsetsDirectional.only(end: kPaddingS),
                          child: StarRating(
                            rating: widget.location.rate,
                            size: 32,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              StrutText(
                                widget.location.rate.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .bold
                                    .fs28,
                              ),
                              StrutText(
                                sprintf('(%s)', <String>[
                                  L10n.of(context).locationTotalReviews(
                                      widget.location.ratings.toString())
                                ]),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        color: Theme.of(context).disabledColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const UppercaseTitle(
                      title: 'Ratings',
                      padding: EdgeInsets.only(bottom: kPaddingM)),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(bottom: kPaddingL),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final double rating = (index - 5).abs().toDouble();
                      final int ratingCount = widget.location.reviews
                          .where((ReviewModel review) => review.rate == rating)
                          .toList()
                          .length;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: kPaddingS),
                        child: Row(
                          children: <Widget>[
                            StarRating(rating: rating, size: kPaddingM),
                            Expanded(
                              child: LinearPercentIndicator(
                                progressColor: kPrimaryColor,
                                lineHeight: 6.0,
                                percent: ratingCount /
                                    widget.location.reviews.length,
                                trailing: Container(
                                  width: 32,
                                  child: StrutText(
                                    ratingCount.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                            color: Theme.of(context).hintColor),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                backgroundColor:
                                    Theme.of(context).highlightColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount:
                        List<int>.generate(5, (int index) => index).length,
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: kPaddingL),
                    children: widget.location.reviews.map((ReviewModel review) {
                      return ReviewListItem(
                        review: review,
                        showDetails: true,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
