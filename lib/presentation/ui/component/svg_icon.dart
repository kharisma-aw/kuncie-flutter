import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    super.key,
    required this.path,
    this.size,
    this.color,
  });

  final String path;

  final Color? color;

  final double? size;

  @override
  Widget build(BuildContext context) {
    final effectiveSize = size ?? IconTheme.of(context).size;

    return SizedBox(
      width: effectiveSize,
      height: effectiveSize,
      child: SvgPicture.asset(
        path,
        color: color ?? IconTheme.of(context).color,
      ),
    );
  }
}
