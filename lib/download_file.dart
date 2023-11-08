library download_file;

import 'package:download_file/data/models/download_file_options.dart';
import 'package:download_file/presentation/widgets/download_file_dialog.dart';
import 'package:flutter/material.dart';

class DownloadFile {
  /// Setup method that will setup default values for the [DownloadFileDialog]
  static void setup({
    Widget? defaultLoadingWidget,
    String? defaultErrorMessage,
  }) {
    DownloadFileDialog.setup(
      defaultErrorMessage: defaultErrorMessage,
      defaultLoadingWidget: defaultLoadingWidget,
    );
  }

  /// Download the file from the given [downloadUrl]
  ///
  /// The [fileName] is the name how the file gets saved. For example "image.png"
  ///
  /// Additionally you can add a [savePath] here if you want to save the file in a
  /// subfolder. You can use "documents/images" here.
  ///
  /// The [loadingWidget] widget that is displaying while the download is loading
  /// If no one is passed it's using the default one
  ///
  /// The [customDialogContent] widget will replace the complete [AlertDialog] content
  /// If you pass this [Widget] you don't need to pass a custom [loadingWidget],
  /// because everything will be overwritten by this anyway
  ///
  /// The [errorMessage] is displayed if an error occurs
  /// If no text is passed it will use the default one
  /// 
  /// Pass [logging] as true to show the logs for the performed request
  static Future<void> downloadAndSafeFile({
    required DownloadFileOptions downloadFileOptions,
    required BuildContext context,
    String? errorMessage,
    Widget? loadingWidget,
    Widget? customDialogContent,
    bool? logging,
  }) async {
    showDialog(
      context: context,
      builder: (_) => DownloadFileDialog(
        logging: logging,
        customDialogContent: customDialogContent,
        errorMessage: errorMessage,
        loadingWidget: loadingWidget,
        downloadFileOptions: downloadFileOptions,
      ),
    );
  }
}
