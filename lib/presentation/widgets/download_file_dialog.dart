import 'package:download_file/data/models/download_file_options.dart';
import 'package:download_file/logic/cubit/download_file_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadFileDialog extends StatelessWidget {
  final DownloadFileOptions downloadFileOptions;
  const DownloadFileDialog({
    super.key,
    required this.downloadFileOptions,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DownloadFileCubit(
        downloadFileOptions: downloadFileOptions,
      ),
      child: BlocListener<DownloadFileCubit, DownloadFileState>(
        listener: (context, state) {
          if (state is DownloadFileError) {
            // TODO: show error message
            Navigator.pop(context);
          }

          if (state is DownloadFileSuccess) {
            Navigator.pop(context);
          }
        },
        child: const AlertDialog(
          // Column is used to not make the [AlertDialog] full height
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
