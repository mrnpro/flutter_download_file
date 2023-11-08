import 'package:dio/dio.dart';
import 'package:download_file/data/models/download_file_options.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Methods performing the API requests for downloading a file
class DownloadFileApi {
  /// Download the file from the [DownloadFileOptions]
  Future<void> downloadFile({
    required String downloadUrl,
    required String savePath,
    bool? logging,
    Map<String, dynamic>? headers,
  }) async {
    Dio dio = Dio();

    if (logging != null && logging) {
      dio.interceptors.add(
        PrettyDioLogger(),
      );
    }

    await dio.download(
      downloadUrl,
      savePath,
      options: Options(
        headers: headers,
      ),
    );
  }
}
