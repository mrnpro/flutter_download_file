Need to download a file and open it in Flutter?🌐

No problem, with this flutter package it is done in a few lines.

# Getting started 🚀
Just simply add the `download_file` package to your dependencies:
```yaml
dependencies:
  download_file: <Newest version>
```

## Download a file ⬇️
```dart
DownloadFile.downloadAndSafeFile(
              downloadFileOptions: DownloadFileOptions(
                downloadUrl: 'https://jsonplaceholder.typicode.com/todos/1',
                fileName: 'todo.json',
              ),
              context: context,
            );
```
To download a file just use the `DownlaodFile.downloadAndSafeFile()` method.
