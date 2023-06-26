import 'package:dio/dio.dart';
import 'package:download_file/data/models/download_file_options.dart';

/// Methods performing the API requests for downloading a file
class DownloadFileApi {
  /// Download the file from the [DownloadFileOptions]
  Future<void> downloadFile({
    required String downloadUrl,
    required String savePath,
  }) async {
    Dio dio = Dio();

    await dio.download(downloadUrl, savePath);
  }
}
