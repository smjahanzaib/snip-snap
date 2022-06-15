import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';

class WavyHeaderImage extends StatelessWidget {
  const WavyHeaderImage({Key key, this.shrinkOffsetPercentage})
      : super(key: key);

  final double shrinkOffsetPercentage;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(AssetsImages.homeWavyHeader),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.grey[700], BlendMode.overlay),
          ),
        ),
      ),
      clipper: BottomWaveClipper(shrinkOffsetPercentage < 0.5
          ? 24 - 24 * 2 * shrinkOffsetPercentage
          : 0),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  BottomWaveClipper(this.heightOffset);

  final double heightOffset;

  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height - heightOffset);

    final Offset firstControlPoint = Offset(size.width / 4, size.height);
    final Offset firstEndPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(size.width - firstControlPoint.dx,
        firstControlPoint.dy, size.width, size.height - heightOffset);
    path.lineTo(size.width, size.height - heightOffset);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  /// If the method returns false, then the [getClip] call might be optimized
  /// away.
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
