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

<img src="https://github.com/musiolmarco/error_text_widget/assets/64715619/55fa2692-f759-48dc-9684-9db33c4fb421" width="300">

Of course there is a lot of things you can customize. Let us take a look at it.
