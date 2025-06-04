import 'package:flutter/material.dart';

class TransparentAppBar extends StatelessWidget {
  final double opacity;
  final VoidCallback? onMenuPressed;

  const TransparentAppBar({
    super.key,
    required this.opacity,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: kToolbarHeight + MediaQuery.of(context).padding.top,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(opacity * 0.7),
              Colors.black.withOpacity(opacity * 0.1),
              Colors.transparent,
            ],
            stops: const [0.0, 0.7, 1.0],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white.withOpacity(
                  opacity > 0.3 ? 1.0 : opacity + 0.7,
                ),
              ),
              onPressed: onMenuPressed,
            ),
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.white.withOpacity(
                  opacity > 0.3 ? 1.0 : opacity + 0.7,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
