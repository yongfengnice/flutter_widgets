import 'dart:ui';

///虚线画笔
class DashPainter {
  ///虚线画笔
  const DashPainter({
    this.step = 2,
    this.span = 2,
    this.pointCount = 0,
    this.pointWidth,
  });

  ///实线长
  final double step;

  ///空格线长
  final double span;

  ///点划线的点数
  final int pointCount;

  ///点划线的点划长
  final double? pointWidth;

  ///
  void paint(Canvas canvas, Path path, Paint paint) {
    final PathMetrics pms = path.computeMetrics();
    final double pointLineLength = pointWidth ?? paint.strokeWidth;
    final double partLength = step + span * (pointCount + 1) + pointCount * pointLineLength;

    for (final pm in pms) {
      final int count = pm.length ~/ partLength;
      for (int i = 0; i < count; i++) {
        canvas.drawPath(
          pm.extractPath(partLength * i, partLength * i + step),
          paint,
        );
        for (int j = 1; j <= pointCount; j++) {
          final start = partLength * i + step + span * j + pointLineLength * (j - 1);
          canvas.drawPath(
            pm.extractPath(start, start + pointLineLength),
            paint,
          );
        }
      }
      final double tail = pm.length % partLength;
      canvas.drawPath(pm.extractPath(pm.length - tail, pm.length - span), paint);
    }
  }
}
