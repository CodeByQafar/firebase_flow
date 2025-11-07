class PlatformException implements Exception {
 final String message;

 const PlatformException(this.message);

 @override
  String toString() {
    return "Exception: $message";
  }
}