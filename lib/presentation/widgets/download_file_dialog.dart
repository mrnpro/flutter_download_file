import 'package:download_file/data/models/download_file_options.dart';
import 'package:download_file/logic/cubit/download_file_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadFileDialog extends StatelessWidget {
  final DownloadFileOptions downloadFileOptions;

  /// The default loading [Widget] that is used if the [loadingWidget] is null
  static Widget _defaultLoadingWidget = const Padding(
    padding: EdgeInsets.all(15.0),
    child: CircularProgressIndicator(),
  );

  /// The default error message that is used if the [errorMessage] is null
  static String _defaultErrorMessage = 'An error occurred during the download';

  /// The widget that is displaying while the download is loading
  ///
  /// If no one is passed it's using the default one
  final Widget? loadingWidget;

  /// This widget will replace the complete [AlertDialog] content
  ///
  /// If you pass this [Widget] you don't need to pass a custom [loadingWidget],
  /// because everything will be overwritten by this anyway
  final Widget? customDialogContent;

  /// This [String] is displayed if an error occurs
  ///
  /// If no text is passed it will use the default one
  final String? errorMessage;

  /// Pass [logging] as true to show the logs for the performed request
  final bool? logging;

  const DownloadFileDialog({
    super.key,
    required this.downloadFileOptions,
    this.loadingWidget,
    this.errorMessage,
    this.logging,
    this.customDialogContent,
  });

  /// Setup the default values of this dialog class
  ///
  /// If a value is passed and not null, it will write it default class content
  static void setup({
    Widget? defaultLoadingWidget,
    String? defaultErrorMessage,
  }) {
    if (defaultLoadingWidget != null) {
      _defaultLoadingWidget = defaultLoadingWidget;
    }

    if (defaultErrorMessage != null) {
      _defaultErrorMessage = defaultErrorMessage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DownloadFileCubit(
        downloadFileOptions: downloadFileOptions,
        logging: logging,
      ),
      child: BlocListener<DownloadFileCubit, DownloadFileState>(
        listener: (context, state) {
          if (state is DownloadFileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  errorMessage ?? _defaultErrorMessage,
                ),
              ),
            );
            Navigator.pop(context);
          }

          if (state is DownloadFileSuccess) {
            Navigator.pop(context);
          }
        },
        child: AlertDialog(
          // Column is used to not make the [AlertDialog] full height
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              customDialogContent ?? loadingWidget ?? _defaultLoadingWidget
            ],
          ),
        ),
      ),
    );
  }
}
