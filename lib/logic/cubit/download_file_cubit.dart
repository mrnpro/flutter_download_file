import 'package:bloc/bloc.dart';
import 'package:download_file/data/models/download_file_options.dart';
import 'package:download_file/data/repositories/download_file_repository.dart';
import 'package:meta/meta.dart';

part 'download_file_state.dart';

class DownloadFileCubit extends Cubit<DownloadFileState> {
  final DownloadFileRepository _downloadFileRepository =
      DownloadFileRepository();
  final DownloadFileOptions downloadFileOptions;
  final bool? logging;
  DownloadFileCubit({
    required this.downloadFileOptions,
    this.logging,
  }) : super(DownloadFileLoading()) {
    _downloadAndOpenFile();
  }

  _downloadAndOpenFile() async {
    emit(DownloadFileLoading());

    try {
      await _downloadFileRepository.downloadAndOpenFile(
        downloadFileOptions: downloadFileOptions,
        logging: logging,
      );

      emit(DownloadFileSuccess());
    } catch (e) {
      emit(DownloadFileError());
    }
  }
}
