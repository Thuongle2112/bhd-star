import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../l10n/locale_keys.g.dart';
import '../../utils/translations/bloc/language_bloc.dart';
import '../../utils/translations/bloc/language_event.dart';

void showLanguageBottomSheet(BuildContext context) {
  final selectedLanguage = context.read<LanguageBloc>().getSelectedLanguage();
  Locale? tempSelectedLanguage = selectedLanguage;

  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFF171717),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LocaleKeys.select_language.tr(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                ...context.read<LanguageBloc>().getLanguageOptions().map((
                  option,
                ) {
                  return ListTile(
                    title: Text(
                      option.locale.languageCode == context.locale.languageCode
                          ? option.displayName
                          : option.locale.languageCode == 'en'
                          ? 'English'
                          : 'Tiếng Việt',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing:
                        option.locale == tempSelectedLanguage
                            ? const Icon(Icons.check, color: Colors.green)
                            : null,
                    onTap: () {
                      setState(() {
                        tempSelectedLanguage = option.locale;
                      });
                    },
                  );
                }).toList(),

                const SizedBox(height: 16),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                        vertical: 10,
                    ),
                    backgroundColor: const Color(0xFF7FBF43),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (tempSelectedLanguage != null &&
                        tempSelectedLanguage != selectedLanguage) {
                      context.read<LanguageBloc>().add(
                        ChangeLanguageEvent(tempSelectedLanguage!, context),
                      );
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    LocaleKeys.confirm.tr(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
