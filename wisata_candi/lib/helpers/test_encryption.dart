import 'package:wisata_candi/helpers/encryption_helper.dart';

/// File untuk testing enkripsi/dekripsi
/// Jalankan dengan: dart lib/helpers/test_encryption.dart
void main() {
  print('=== Test Enkripsi AES ===\n');
  
  // Test 1: Enkripsi dan dekripsi string normal
  String text1 = 'Password123!';
  String encrypted1 = EncryptionHelper.encryptText(text1);
  String decrypted1 = EncryptionHelper.decryptText(encrypted1);
  
  print('Test 1 - String Normal:');
  print('Original: $text1');
  print('Encrypted: $encrypted1');
  print('Decrypted: $decrypted1');
  print('Status: ${text1 == decrypted1 ? "✓ PASS" : "✗ FAIL"}\n');
  
  // Test 2: Enkripsi string kosong
  String text2 = '';
  String encrypted2 = EncryptionHelper.encryptText(text2);
  String decrypted2 = EncryptionHelper.decryptText(encrypted2);
  
  print('Test 2 - String Kosong:');
  print('Original: "$text2"');
  print('Encrypted: "$encrypted2"');
  print('Decrypted: "$decrypted2"');
  print('Status: ${text2 == decrypted2 ? "✓ PASS" : "✗ FAIL"}\n');
  
  // Test 3: Dekripsi string kosong langsung
  String decrypted3 = EncryptionHelper.decryptText('');
  
  print('Test 3 - Dekripsi String Kosong:');
  print('Input: ""');
  print('Output: "$decrypted3"');
  print('Status: ${decrypted3 == '' ? "✓ PASS" : "✗ FAIL"}\n');
  
  // Test 4: Username dan fullname
  String username = 'johndoe';
  String fullname = 'John Doe';
  
  String encUsername = EncryptionHelper.encryptText(username);
  String encFullname = EncryptionHelper.encryptText(fullname);
  
  String decUsername = EncryptionHelper.decryptText(encUsername);
  String decFullname = EncryptionHelper.decryptText(encFullname);
  
  print('Test 4 - Username & Fullname:');
  print('Username: $username -> $encUsername -> $decUsername');
  print('Fullname: $fullname -> $encFullname -> $decFullname');
  print('Status: ${username == decUsername && fullname == decFullname ? "✓ PASS" : "✗ FAIL"}\n');
  
  print('=== Test Selesai ===');
}
