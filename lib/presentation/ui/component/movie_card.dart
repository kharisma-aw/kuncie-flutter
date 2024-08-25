import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kuncie_flutter_test/common/utils/platform_utils.dart';
import 'package:kuncie_flutter_test/common/utils/string_utils.dart';
import 'package:kuncie_flutter_test/data/model/movie.dart';
import 'package:kuncie_flutter_test/presentation/ui/component/shimmer.dart';
import 'package:kuncie_flutter_test/presentation/ui/component/svg_icon.dart';
import 'package:kuncie_flutter_test/presentation/ui/text_style.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.width,
    required this.data,
    required this.onTap,
    required this.isExpanded,
  });

  final double width;

  final Movie data;

  final VoidCallback onTap;

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final imageWidth = PlatformUtils.isMobile ? 75.0 : 150.0;
    final imageHeight = PlatformUtils.isMobile
        ? (isExpanded ? 120.0 : 100.0)
        : (isExpanded ? 240.0 : 200.0);

    return InkWell(
      key: Key('movieCard${data.id}'),
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        surfaceTintColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: data.posterPath,
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.cover,
                placeholder: (_, __) => ShimmerLoading(
                  isLoading: true,
                  child: Container(
                    width: imageWidth,
                    height: imageHeight,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                errorWidget: (_, __, ___) => Container(color: Colors.grey),
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: width - imageWidth - 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(data.title, style: AppText.xlSemiBold),
                    const SizedBox(height: 8),
                    _rating(),
                    const SizedBox(height: 8),
                    Text(
                      data.releaseDate?.year.toString() ?? '-',
                      style: AppText.base.copyWith(fontStyle: FontStyle.italic),
                    ),
                    if (isExpanded) ...[
                      const SizedBox(height: 8),
                      Text(
                        data.overview.ellipsizeByLength(240),
                        style: AppText.base,
                      ),
                    ],
                    if (isExpanded && data.genres.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: [
                          ...data.genres
                              .take(3)
                              .map((genre) => _genre(genre.name))
                              .toList(),
                          if (data.genres.length > 3)
                            _genre('+${data.genres.length - 3}'),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rating() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: Colors.orange),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SvgIcon(
            path: 'assets/images/star_icon.svg',
            color: Colors.orange,
            size: 12,
          ),
          const SizedBox(width: 4),
          Text(
            data.voteAverage.toString(),
            style: AppText.baseSemiBold.copyWith(color: Colors.orange),
          ),
        ],
      ),
    );
  }

  Widget _genre(String genre) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: Colors.black45),
      ),
      child: Text(
        genre,
        style: AppText.baseSemiBold.copyWith(color: Colors.black45),
      ),
    );
  }
}
