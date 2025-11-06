class EnvFileNotFoundException implements Exception {
 final String message;
 const EnvFileNotFoundException(this.message);
  
  @override
  String toString() {
    return "Exception: $message";
  }
}