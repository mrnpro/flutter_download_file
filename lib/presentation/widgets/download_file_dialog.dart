import 'package:download_file/data/models/download_file_options.dart';
import 'package:download_file/logic/cubit/download_file_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadFileDialog extends StatelessWidget {
  final DownloadFileOptions downloadFileOptions;

  /// The widget that is displaying while the download is loading
  ///
  /// If no one is passed it's using the default one
  final Widget? loadingWidget;

  const DownloadFileDialog({
    super.key,
    required this.downloadFileOptions,
    this.loadingWidget,
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
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'An error occurred during the download',
                ),
              ),
            );
            Navigator.pop(context);
          }

          if (state is DownloadFileSuccess) {
            Navigator.pop(context);
          }
        },
        child: AlertDialog(
          // Column is used to not make the [AlertDialog] full height
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              loadingWidget ??
                  const Padding(
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
