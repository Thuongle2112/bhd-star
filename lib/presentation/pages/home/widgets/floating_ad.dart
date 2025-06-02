import 'package:flutter/material.dart';

class FloatingAd extends StatelessWidget {
  final Offset position;
  final Function(Offset) onPositionChanged;
  final VoidCallback onClose;

  const FloatingAd({
    super.key,
    required this.position,
    required this.onPositionChanged,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          onPositionChanged(
            Offset(
              position.dx + details.delta.dx,
              position.dy + details.delta.dy,
            ),
          );
        },
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
            ],
          ),
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  debugPrint("Navigating to ad destination");
                },
                child: ClipOval(
                  child: Image.network(
                    'https://scontent.fhan15-1.fna.fbcdn.net/v/t39.30808-6/499909691_1111714667666220_5263535657530052335_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeHccaWmHOpC5Sl_aKVYulDhpzEpxT42PnKnMSnFPjY-cqWZOj1gw4zhr5jAhMXTuAb7pOECZj9q2B6Mhj_fFK6E&_nc_ohc=RgIMHYXXYWQQ7kNvwGGALXX&_nc_oc=AdnhhOyTt0twbAFnfY-1HeJElrhEhz2Z9HRuXtRf_kE_uZTehMw0GksQ4gbf9ehSLaHgJJykh1HL9Zs2Sxb917Dt&_nc_zt=23&_nc_ht=scontent.fhan15-1.fna&_nc_gid=aEEm9__xXffTj50iEsMx2A&oh=00_AfIebEVlUlELkF6YXIP8yp537FPqiLEdzxZUQJo9r0lBpA&oe=68431982',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey,
                        child: const Center(
                          child: Text(
                            "DORAEMON",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              Positioned(
                right: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: onClose,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.black45,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
