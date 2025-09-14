import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mvvm_boilerplate/core/theme/app_css.dart';
import 'package:mvvm_boilerplate/core/utils/spacing.dart';

class AppErrorBoundary extends StatefulWidget {
  final Widget child;
  final Widget? fallback;
  final VoidCallback? onError;

  const AppErrorBoundary({
    super.key,
    required this.child,
    this.fallback,
    this.onError,
  });

  @override
  State<AppErrorBoundary> createState() => _AppErrorBoundaryState();
}

class _AppErrorBoundaryState extends State<AppErrorBoundary> {
  bool hasError = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    // Catch Flutter framework errors
    FlutterError.onError = (FlutterErrorDetails details) {
      _handleError(details.exception, details.stack);
    };
  }

  void _handleError(dynamic error, StackTrace? stackTrace) {
    log('AppErrorBoundary caught error: $error',
        error: error, stackTrace: stackTrace);

    setState(() {
      hasError = true;
      errorMessage = error.toString();
    });

    widget.onError?.call();
  }

  @override
  Widget build(BuildContext context) {
    if (hasError) {
      return widget.fallback ?? _buildErrorWidget();
    }

    return widget.child;
  }

  Widget _buildErrorWidget() {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const VSpace(24),
              Text(
                'Something went wrong',
                style: AppCss.h3,
                textAlign: TextAlign.center,
              ),
              const VSpace(16),
              Text(
                'We encountered an unexpected error. Please try again.',
                style: AppCss.bodyBase,
                textAlign: TextAlign.center,
              ),
              if (errorMessage != null) ...[
                const VSpace(16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    errorMessage!,
                    style: AppCss.caption.copyWith(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ],
              const VSpace(32),
              FilledButton(
                onPressed: () {
                  setState(() {
                    hasError = false;
                    errorMessage = null;
                  });
                },
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Global error handler for async errors
class GlobalErrorHandler {
  static void initialize() {
    // Catch async errors that aren't caught by FlutterError.onError
    PlatformDispatcher.instance.onError = (error, stack) {
      log('GlobalErrorHandler caught async error: $error',
          error: error, stackTrace: stack);
      return true; // Mark as handled
    };
  }
}
