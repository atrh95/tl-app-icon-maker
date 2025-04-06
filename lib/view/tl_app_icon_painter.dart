import 'package:flutter/material.dart';
import 'package:maker/style/tl_app_icon_theme.dart';

class TLAppIconPainter extends CustomPainter {
  final TLAppIconThemeType themeType;

  TLAppIconPainter({this.themeType = TLAppIconThemeType.sunOrange});

  @override
  void paint(Canvas canvas, Size size) {
    final coordinateSpacing = size.width / 100;
    final currentTheme = themeMap[themeType]!;

    dynamic getCoordinate({double? x, double? y}) {
      if (x != null && y != null) {
        return Offset(
            coordinateSpacing * x, size.height - coordinateSpacing * y);
      } else if (x != null) {
        return coordinateSpacing * x;
      } else if (y != null) {
        return size.height - coordinateSpacing * y;
      }
    }

    // 背景
    final paint = Paint()
      ..color = currentTheme.boardColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
        RRect.fromLTRBR(
            0, 0, size.width, size.height, const Radius.circular(50)),
        paint);

    // チェックマークの背景
    paint.color = currentTheme.checkmarkColor;
    canvas.drawCircle(getCoordinate(x: 50, y: 35), 40, paint);

    // チェックマーク
    Path path = Path();
    path.moveTo(getCoordinate(x: 40), getCoordinate(y: 35));
    path.lineTo(getCoordinate(x: 47), getCoordinate(y: 28));
    path.lineTo(getCoordinate(x: 60), getCoordinate(y: 41));
    paint
      ..color = currentTheme.boardColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    //帽子を描く
    canvas.drawPath(path, paint);
    paint
      ..color = currentTheme.hatColor
      ..style = PaintingStyle.fill;
    final RRect hatRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(
        0,
        0,
        size.width,
        80,
      ),
      topLeft: const Radius.circular(50), // 左上の角を丸くする
      topRight: const Radius.circular(50), // 右上の角を丸くする
      bottomLeft: Radius.zero, // 左下の角は直角にする
      bottomRight: Radius.zero, // 右下の角は直角にする
    );
    canvas.drawRRect(hatRect, paint);
  }

  @override
  bool shouldRepaint(covariant TLAppIconPainter oldDelegate) {
    // Repaint if the theme changes
    return oldDelegate.themeType != themeType;
  }
}
