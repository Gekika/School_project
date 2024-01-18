import 'dart:convert';
import 'package:crypto/crypto.dart';

class EncryptionService {
  static final String _key = 'your_secret_key'; // Replace with a secure key

  static String encrypt(String data) {
    final key = utf8.encode(_key);
    final bytes = utf8.encode(data);
    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(bytes);
    return digest.toString();
  }

  static String decrypt(String encryptedData) {
    // Decryption is not necessary for data retrieved from Firebase in this example
    return encryptedData;
  }
}
