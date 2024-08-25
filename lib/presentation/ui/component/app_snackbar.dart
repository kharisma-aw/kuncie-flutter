import 'package:flutter/material.dart';
import 'package:kuncie_flutter_test/presentation/ui/colors.dart';
import 'package:kuncie_flutter_test/presentation/ui/component/svg_icon.dart';
import 'package:kuncie_flutter_test/presentation/ui/text_style.dart';

class SnackBarData {
  SnackBarData({
    this.leading,
    required this.message,
    this.info,
    this.action,
    this.type = SnackBarType.regular,
    this.onAction,
    this.onClosed,
  });

  final String? leading;

  final String message;

  final String? info;

  final String? action;

  final SnackBarType type;

  final VoidCallback? onAction;

  final void Function(SnackBarClosedReason reason)? onClosed;
}

enum SnackBarType {
  regular(
    backgroundColor: AppColors.neutral100,
    actionColor: AppColors.primary300,
    infoLabelColor: AppColors.neutral60,
  ),
  success(
    backgroundColor: AppColors.success700,
    actionColor: Colors.white,
    infoLabelColor: AppColors.success50,
  ),
  error(
    backgroundColor: AppColors.error700,
    actionColor: Colors.white,
    infoLabelColor: AppColors.error50,
  );

  const SnackBarType({
    required this.backgroundColor,
    required this.actionColor,
    required this.infoLabelColor,
  });

  final Color backgroundColor;

  final Color actionColor;

  final Color infoLabelColor;
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showAppSnackBar(
  BuildContext context,
  SnackBarData data,
) {
  final controller = ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: data.type.backgroundColor,
      margin: const EdgeInsets.all(8),
      padding: _padding(data),
      behavior: SnackBarBehavior.floating,
      content: IconTheme(
        data: _iconTheme(context),
        child: Row(
          children: [
            if (data.leading != null) ...[
              _leading(data),
              const SizedBox(width: 16),
            ],
            Expanded(child: _content(data)),
            if (data.action != null) ...[
              const SizedBox(width: 16),
              _action(data),
            ],
          ],
        ),
      ),
    ),
  )..closed.then((reason) => data.onClosed?.call(reason));

  return controller;
}

IconThemeData _iconTheme(BuildContext context) {
  return IconTheme.of(context)
      .merge(const IconThemeData(color: Colors.white, size: 24));
}

EdgeInsets _padding(SnackBarData data) {
  return EdgeInsets.only(
    left: 16,
    top: 16,
    right: data.action != null ? 8 : 16,
    bottom: 16,
  );
}

Widget _leading(SnackBarData data) {
  return SvgIcon(path: data.leading!);
}

Widget _content(SnackBarData data) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        data.message,
        style: AppText.xlSemiBold.copyWith(color: Colors.white),
      ),
      if (data.info != null)
        Text(
          data.info!,
          style: AppText.xl.copyWith(color: data.type.infoLabelColor),
        ),
    ],
  );
}

Widget _action(SnackBarData data) {
  return Builder(
    builder: (context) {
      return GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar(
            reason: SnackBarClosedReason.action,
          );
          data.onAction?.call();
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            data.action!,
            style: AppText.xlSemiBold.copyWith(color: data.type.actionColor),
          ),
        ),
      );
    },
  );
}
