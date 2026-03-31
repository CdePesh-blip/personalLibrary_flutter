import 'package:flutter/material.dart';

class RoundedRectangleTabIndicator extends Decoration {
  final BoxPainter _painter;

  RoundedRectangleTabIndicator({
    required Color color,
    required double weight,
    required double width,
  }) : _painter = _RRectanglePainterColor(color, weight, width);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _RRectanglePainterColor extends BoxPainter {
  final Paint _paint;
  final double weight;
  final double width;

  _RRectanglePainterColor(Color color, this.weight, this.width)
    : _paint = Paint()
        ..color = color
        ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    if (cfg.size == null) return;
    final double hostHeight = cfg.size!.height;
    final double hostWidth = cfg.size!.width;
    final double xOffset = offset.dx + (hostWidth / 2) - (width / 2);

    final Offset customOffset = Offset(xOffset, hostHeight - weight);

    final Rect rect = customOffset & Size(width, weight);

    final RRect myRRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(weight),
    );

    canvas.drawRRect(myRRect, _paint);
  }
}
