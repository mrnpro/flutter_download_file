part of 'download_file_cubit.dart';

@immutable
abstract class DownloadFileState {}

class DownloadFileLoading extends DownloadFileState {}

class DownloadFileError extends DownloadFileState {}

class DownloadFileSuccess extends DownloadFileState {}
