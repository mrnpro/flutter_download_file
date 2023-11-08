// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// This model is used to define a variant of useful values that are used to download files
class DownloadFileOptions {
  /// URL that the file should be downloaded from
  final String downloadUrl;

  /// The name of the file with which the file should be saved with
  ///
  /// For example you can use "image.jpg" here
  ///
  /// !! Please do not add any path in here !!
  final String fileName;

  /// Set this value if you want to save the file in a specific part
  ///
  /// You can pass "users/images" for example
  ///
  /// Please note that you don't need to pass the file name here again
  /// it will be automatically generated from the [fileName]
  final String? customSavePath;

  /// Headers that can be passed and will be used for the request
  final Map<String, dynamic>? headers;

  /// The final generated save path that should be used after the application documents directory
  /// to save the file
  ///
  /// If the [customSavePath] is not null it will check if the last character is a "/"
  /// to handle and prevent errors
  /// [customSavePath] is "users/images/" will be returned as "users/images/[fileName]"
  /// [customSavePath] is "users/images" will also be returned as "users/images/[fileName]"
  /// by adding the slash manually.
  String get getSavePath {
    if (customSavePath != null) {
      if (customSavePath!.endsWith('/')) {
        return '$customSavePath$fileName';
      } else {
        return '$customSavePath/$fileName';
      }
    }

    return fileName;
  }

  DownloadFileOptions({
    required this.downloadUrl,
    required this.fileName,
    this.customSavePath,
    this.headers,
  });

  DownloadFileOptions copyWith({
    String? downloadUrl,
    String? fileName,
    String? customSavePath,
  }) {
    return DownloadFileOptions(
      downloadUrl: downloadUrl ?? this.downloadUrl,
      fileName: fileName ?? this.fileName,
      customSavePath: customSavePath ?? this.customSavePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'downloadUrl': downloadUrl,
      'fileName': fileName,
      'customSavePath': customSavePath,
    };
  }

  factory DownloadFileOptions.fromMap(Map<String, dynamic> map) {
    return DownloadFileOptions(
      downloadUrl: map['downloadUrl'] as String,
      fileName: map['fileName'] as String,
      customSavePath: map['customSavePath'] != null
          ? map['customSavePath'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DownloadFileOptions.fromJson(String source) =>
      DownloadFileOptions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DownloadFileOptions(downloadUrl: $downloadUrl, fileName: $fileName, customSavePath: $customSavePath)';

  @override
  bool operator ==(covariant DownloadFileOptions other) {
    if (identical(this, other)) return true;

    return other.downloadUrl == downloadUrl &&
        other.fileName == fileName &&
        other.customSavePath == customSavePath;
  }

  @override
  int get hashCode =>
      downloadUrl.hashCode ^ fileName.hashCode ^ customSavePath.hashCode;
}
