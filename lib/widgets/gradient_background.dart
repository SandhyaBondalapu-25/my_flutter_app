import 'package:flutter/material.dart';
import 'dart:math';

/// Custom painter for soft circular bubble shapes on the gradient background
class BubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Large bubble top-left
    paint.color = Colors.white.withOpacity(0.08);
    canvas.drawCircle(
      Offset(size.width * 0.15, size.height * 0.12),
      size.width * 0.25,
      paint,
    );

    // Medium bubble top-right
    paint.color = Colors.white.withOpacity(0.06);
    canvas.drawCircle(
      Offset(size.width * 0.85, size.height * 0.08),
      size.width * 0.18,
      paint,
    );

    // Small bubble mid-left
    paint.color = Colors.white.withOpacity(0.07);
    canvas.drawCircle(
      Offset(size.width * 0.08, size.height * 0.45),
      size.width * 0.12,
      paint,
    );

    // Large bubble bottom-right
    paint.color = Colors.white.withOpacity(0.05);
    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.55),
      size.width * 0.22,
      paint,
    );

    // Medium bubble bottom-left
    paint.color = Colors.white.withOpacity(0.06);
    canvas.drawCircle(
      Offset(size.width * 0.25, size.height * 0.78),
      size.width * 0.15,
      paint,
    );

    // Small bubble bottom-center
    paint.color = Colors.white.withOpacity(0.04);
    canvas.drawCircle(
      Offset(size.width * 0.6, size.height * 0.85),
      size.width * 0.1,
      paint,
    );

    // Tiny bubble mid-right
    paint.color = Colors.white.withOpacity(0.08);
    canvas.drawCircle(
      Offset(size.width * 0.75, size.height * 0.35),
      size.width * 0.06,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Gradient background with bubbles — reusable across screens
class GradientBubbleBackground extends StatelessWidget {
  final Widget child;
  const GradientBubbleBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF7B1FA2), // Deep purple
            Color(0xFFAB47BC), // Medium purple
            Color(0xFFE91E90), // Hot pink
            Color(0xFFEC407A), // Pink
          ],
          stops: [0.0, 0.35, 0.7, 1.0],
        ),
      ),
      child: CustomPaint(
        painter: BubblePainter(),
        child: child,
      ),
    );
  }
}

/// Student avatar circle widget
class StudentAvatar extends StatelessWidget {
  final double size;
  const StudentAvatar({super.key, this.size = 120});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.15),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
      ),
      child: Icon(
        Icons.person,
        size: size * 0.55,
        color: Colors.white,
      ),
    );
  }
}
