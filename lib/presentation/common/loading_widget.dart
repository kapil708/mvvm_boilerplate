import 'package:flutter/material.dart';
import 'package:mvvm_boilerplate/core/theme/app_css.dart';
import 'package:mvvm_boilerplate/core/utils/spacing.dart';
import 'package:mvvm_boilerplate/l10n/app_localizations.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;
  const LoadingWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Material(
      color: Colors.black38,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const CircularProgressIndicator(color: Colors.white),
            ),
            if (message != null) ...[
              VSpace(32),
              Text(
                message ?? l10n.loadingData,
                style: AppCss.h2.copyWith(color: Colors.white),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
