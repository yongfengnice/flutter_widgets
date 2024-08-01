import 'package:file_picker/file_picker.dart';

/// @author：yongfeng
/// @data：2024/7/30 16:08
///
class FileUtils {
  FileUtils._internal();

  ///选择一张图片
  static Future<String?> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg'],
    );
    return result?.paths?.firstOrNull;
  }
}
