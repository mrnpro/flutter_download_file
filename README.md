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
To download a file just use the `DownlaodFile.downloadAndSafeFile()` method. Here you need to pass the current `context` and a `DownloadFileOptions` with a `downloadUrl` ('https://jsonplaceholder.typicode.com/todos/1') and a `fileName` ('todo.json') how the file should be saved as. 

## DownloadFileOptions 💾
While you can pass a `downloadUrl` and a `fileName` as described above, you can additionally add a `customSavePath`. This can for example be "users/images". This will save the file into the "users/images/[fileName]" directory.

```dart
DownloadFileOptions(
                downloadUrl: 'https://jsonplaceholder.typicode.com/todos/1',
                fileName: 'todo.json',
                customSavePath: 'user/todos'
              ),
```

## Custom widgets 🚧
To modify the appearance of the widget, you can pass the following parameters:
```dart
DownloadFile.downloadAndSafeFile(
              downloadFileOptions: DownloadFileOptions(
                downloadUrl: 'https://jsonplaceholder.typicode.com/todos/1',
                fileName: 'todo.json',
                customSavePath: 'users/todos'
              ),
              context: context,
              errorMessage: 'This is an example error message...',
              loadingWidget: CustomLoadingWidget()
            );
```

## Setup method (optional) ⚒️
You can also modify the default values of the package, so you don't have to pass them manually everytime. Just use the `DownloadFile.setup()` method in your main method for that.
```dart
void main() {
  DownloadFile.setup(
    defaultErrorMessage: 'This is an example error message...',
    defaultLoadingWidget: CustomLoadingWidget(),
  );

  runApp(const MyApp());
}
```
