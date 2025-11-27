import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EncryptionHelper {
  // Key dan IV harus sama untuk enkripsi dan dekripsi
  // CATATAN: Dalam aplikasi production, key dan IV sebaiknya disimpan dengan aman
  // dan tidak di-hardcode seperti ini
  static final key = Key.fromUtf8('my32lengthsupersecretnooneknows1'); // 32 chars
  //static final key = Key.fromLength(32);
  //static final iv = IV.fromLength(16);
  static final iv = IV.fromUtf8('1234567890123456'); 
  static final encrypter = Encrypter(AES(key));


  /// Mengenkripsi teks menggunakan AES
  /// [plainText] adalah teks yang akan dienkripsi
  /// Mengembalikan teks terenkripsi dalam format base64
  static String encryptText(String plainText) {
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  /// Mendekripsi teks yang telah dienkripsi
  /// [encryptedText] adalah teks terenkripsi dalam format base64
  /// Mengembalikan teks asli yang sudah didekripsi
  static String decryptText(String encryptedText) {
    final encrypted = Encrypted.fromBase64(encryptedText);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }
}
