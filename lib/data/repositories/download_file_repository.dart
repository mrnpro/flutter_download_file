import 'dart:io';

import 'package:download_file/data/api/download_file_api.dart';
import 'package:download_file/data/models/download_file_options.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

/// Repository class for methods to download files
class DownloadFileRepository {
  /// Is used for download the file
  final DownloadFileApi _downloadFileApi = DownloadFileApi();

  /// Download and automatically open the file from the given [DownloadFileOptions]
  Future<void> downloadAndOpenFile({
    required DownloadFileOptions downloadFileOptions,
  }) async {
    final Directory applicationDocumentsDirectory =
        await getApplicationDocumentsDirectory();

    final String completeSavePath =
        '$applicationDocumentsDirectory/${downloadFileOptions.getSavePath}';

    await _downloadFileApi.downloadFile(
      downloadUrl: downloadFileOptions.downloadUrl,
      savePath: completeSavePath,
    );

    await OpenFilex.open(completeSavePath);
  }
}
