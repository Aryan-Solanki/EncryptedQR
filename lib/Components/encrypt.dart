
import 'dart:typed_data';
import 'package:encryptor/encryptor.dart';

String encrypt(String plainText ) {

  var key = 'mzTJ1e8QWb7hKv9fXyNUt6pc5xgZSAkD';
  var encrypted = Encryptor.encrypt(key, plainText);



  return encrypted;

}

String decrypt(String encrypted) {

  var key = 'mzTJ1e8QWb7hKv9fXyNUt6pc5xgZSAkD';
  var decrypted = Encryptor.decrypt(key, encrypted);

  return (decrypted);
}

