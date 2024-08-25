import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextLocalizations on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this);
}
