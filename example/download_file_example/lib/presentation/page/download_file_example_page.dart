import 'package:download_file/data/models/download_file_options.dart';
import 'package:download_file/download_file.dart';
import 'package:flutter/material.dart';

class DownloadFileExamplePage extends StatelessWidget {
  const DownloadFileExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            DownloadFile.downloadAndSafeFile(
              downloadFileOptions: DownloadFileOptions(
                downloadUrl: 'https://jsonplaceholder.typicode.com/todos/1',
                fileName: 'todo.json',
              ),
              logging: true,
              context: context,
            );
          },
          child: const Text(
            'Download',
          ),
        ),
      ),
    );
  }
}
