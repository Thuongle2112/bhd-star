import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../l10n/locale_keys.g.dart';
import 'bloc/language_bloc.dart';
import 'bloc/language_event.dart';
import 'bloc/language_state.dart';

class LanguageSettingWidget extends StatefulWidget {
  const LanguageSettingWidget({super.key});

  @override
  State<LanguageSettingWidget> createState() => _LanguageSettingWidgetState();
}

class _LanguageSettingWidgetState extends State<LanguageSettingWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      bloc: context.read<LanguageBloc>(),
      builder: (context, state) {
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              // title: Text(LocaleKeys.Language.tr(),
              title: Text(
                "Language",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context
                        .read<LanguageBloc>()
                        .getLanguageOptions()
                        .firstWhere(
                          (option) =>
                              option.locale ==
                              context
                                  .read<LanguageBloc>()
                                  .getSelectedLanguage(),
                        )
                        .displayName,
                  ),
                  const Gap(10),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children:
                          context.read<LanguageBloc>().getLanguageOptions().map(
                            (option) {
                              return ListTile(
                                leading: SvgPicture.asset(
                                  option.flagIcon,
                                  width: 45,
                                  height: 35,
                                  fit: BoxFit.fill,
                                ),
                                title: Text(
                                  option.displayName,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                onTap: () {
                                  context.read<LanguageBloc>().add(
                                    ChangeLanguageEvent(option.locale, context),
                                  );
                                  context.pop();
                                  setState(() {});
                                },
                              );
                            },
                          ).toList(),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
