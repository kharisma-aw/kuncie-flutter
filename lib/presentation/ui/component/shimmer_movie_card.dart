import 'package:flutter/material.dart';
import 'package:kuncie_flutter_test/common/utils/platform_utils.dart';
import 'package:kuncie_flutter_test/presentation/ui/component/shimmer.dart';

class ShimmerMovieCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width - 40;
    final imageWidth = PlatformUtils.isMobile ? 75.0 : 150.0;
    final imageHeight = PlatformUtils.isMobile ? 100.0 : 200.0;
    const boxDecoration = const BoxDecoration(
      color: Colors.black,
      shape: BoxShape.rectangle,
    );

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      surfaceTintColor: Colors.transparent,
      child: ShimmerLoading(
        isLoading: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: imageWidth,
                height: imageHeight,
                decoration: boxDecoration,
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: cardWidth - imageWidth - 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      height: 24,
                      decoration: boxDecoration,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: 100,
                      height: 16,
                      decoration: boxDecoration,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: 100,
                      height: 16,
                      decoration: boxDecoration,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
