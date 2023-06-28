import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:download_file/data/models/download_file_options.dart';
import 'package:download_file/data/repositories/download_file_repository.dart';
import 'package:meta/meta.dart';

part 'download_file_state.dart';

class DownloadFileCubit extends Cubit<DownloadFileState> {
  final DownloadFileRepository _downloadFileRepository =
      DownloadFileRepository();
  final DownloadFileOptions downloadFileOptions;
  DownloadFileCubit({
    required this.downloadFileOptions,
  }) : super(DownloadFileLoading()) {
    _downloadAndOpenFile();
  }

  _downloadAndOpenFile() async {
    emit(DownloadFileLoading());

    try {
      await _downloadFileRepository.downloadAndOpenFile(
        downloadFileOptions: downloadFileOptions,
      );

      emit(DownloadFileSuccess());
    } catch (e) {
      emit(DownloadFileError());
    }
  }
}
