import 'package:flutter/material.dart';
import 'package:kuncie_flutter_test/localizations/localizations_utils.dart';
import 'package:kuncie_flutter_test/presentation/ui/text_style.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    this.title,
    this.description,
    this.button,
    this.onButtonPressed,
    this.centered = true,
  });

  const EmptyState.empty({
    required this.title,
    this.description,
    this.button,
    this.onButtonPressed,
    this.centered = true,
  });

  EmptyState.searchNotFound({
    required BuildContext context,
    String? query,
    this.centered = true,
  })  : title = context.localizations.noResult,
        description = context.localizations.noMovieFound(query ?? ''),
        button = null,
        onButtonPressed = null;

  EmptyState.error({
    required BuildContext context,
    required VoidCallback onRetried,
    required Object error,
    this.centered = true,
  })  : title = context.localizations.errorOccured,
        description = context.localizations.failedToLoadData,
        button = context.localizations.retry,
        onButtonPressed = onRetried;

  final String? title;

  final String? description;

  final String? button;

  final VoidCallback? onButtonPressed;

  final bool centered;

  @override
  Widget build(BuildContext context) {
    final emptyState = Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Text(
              title!,
              textAlign: TextAlign.center,
              style: AppText.x2lSemiBold,
            ),
          if (description != null) ...[
            if (title != null) const SizedBox(height: 8),
            Text(
              description!,
              textAlign: TextAlign.center,
              style: AppText.xl.copyWith(color: Colors.black.withOpacity(.8)),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          if (button != null) ...[
            const SizedBox(height: 16),
            _button(),
          ],
        ],
      ),
    );

    return centered
        ? Center(child: SingleChildScrollView(child: emptyState))
        : emptyState;
  }

  Widget _button() {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 160),
      child: ElevatedButton(
        style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(AppText.xsSemiBold),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
        ),
        onPressed: onButtonPressed,
        child: Text(button!),
      ),
    );
  }
}
