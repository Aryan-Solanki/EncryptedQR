# AES Encryption and QR Code Transfer in Flutter

This Flutter application demonstrates how to use AES encryption to securely transfer data through QR codes. The application takes a details of user then encrypts them using AES encryption, generates a QR code image of the same, and displays the QR code on the screen. The receiver can then scan the QR code with the same application , decode the QR code image to obtain the user profile details.

## Requirements

This application requires the following dependencies:

- `encryptor`: for AES encryption
- `qr_flutter`: for generating QR codes
- `qr_code_scanner`: for scanning QR codes
- `shared_preferences`: for local data storage

## Usage

To run the application, clone the repository and run `flutter pub get` to install the dependencies. Then, run the application on an emulator or a physical device using `flutter run`.

To use the application, enter all the registration details this will generate your local profile .Now by clicking on "QR Icon next to profile image" button an AES encrypted QR will be generated. Some other person can also create his/her profile and can decrypt this code using "Scan QR Code" button.

## Note

This application uses the `qr_code_scanner` dependency to open camera on web platform. However, this dependency is not supported by all browsers.
