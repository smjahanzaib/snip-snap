import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

/// A Star rating with touch and swipe rate enabled.
///
/// Original implementation by https://github.com/thangmam/smoothratingbar
class StarRating extends StatelessWidget {
  const StarRating({
    this.starCount = 5,
    this.spacing = 0.0,
    this.rating = 0.0,
    this.defaultIconData,
    this.onRatingChanged,
    this.color,
    this.borderColor,
    this.size = 24,
    this.filledIconData,
    this.halfFilledIconData,
    this.allowHalfRating = true,
  }) : assert(rating != null);

  /// The maximum amount of stars.
  final int starCount;

  /// The current value of rating.
  final double rating;

  /// Rating changed callback.
  final RatingChangeCallback onRatingChanged;

  /// The body color of star.
  final Color color;

  /// The border color of star.
  final Color borderColor;

  /// The size of a single star.
  final double size;

  /// Whether to use whole number for rating(1.0  or 0.5).
  final bool allowHalfRating;

  /// Full Rated Icon.
  final IconData filledIconData;

  /// Half Rated Icon.
  final IconData halfFilledIconData;

  /// Default Rated Icon.
  final IconData defaultIconData;

  /// Spacing between stars(default is 0.0).
  final double spacing;

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        defaultIconData ?? Icons.star_border,
        color: borderColor ?? Theme.of(context).accentColor,
        size: size,
      );
    } else if (index > rating - (allowHalfRating ? 0.5 : 1.0) && index < rating) {
      icon = Icon(
        halfFilledIconData ?? Icons.star_half,
        color: color ?? Theme.of(context).accentColor,
        size: size,
      );
    } else {
      icon = Icon(
        filledIconData ?? Icons.star,
        color: color ?? Theme.of(context).accentColor,
        size: size,
      );
    }

    return GestureDetector(
      onTap: () {
        if (onRatingChanged != null) {
          onRatingChanged(index + 1.0);
        }
      },
      onHorizontalDragUpdate: (DragUpdateDetails dragDetails) {
        final RenderBox box = context.findRenderObject() as RenderBox;
        final Offset _pos = box.globalToLocal(dragDetails.globalPosition);
        final double i = _pos.dx / size;

        double newRating = allowHalfRating ? i : i.round().toDouble();

        if (newRating > starCount) {
          newRating = starCount.toDouble();
        }
        if (newRating < 0) {
          newRating = 0.0;
        }
        if (onRatingChanged != null) {
          onRatingChanged(newRating);
        }
      },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: spacing,
        children: List<Widget>.generate(
          starCount,
          (int index) => buildStar(context, index),
        ),
      ),
    );
  }
}
