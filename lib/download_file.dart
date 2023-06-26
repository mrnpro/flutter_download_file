library download_file;

import 'package:download_file/data/models/download_file_options.dart';

class DownloadFile {
  /// Download the file from the given [downloadUrl]
  ///
  /// The [fileName] is the name how the file gets saved. For example "image.png"
  ///
  /// Additionally you can add a [savePath] here if you want to save the file in a
  /// subfolder. You can use "documents/images" here.
  static Future<void> downloadAndSafeFile({
    required DownloadFileOptions downloadFileOptions,
  }) async {}
}
