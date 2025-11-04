class DeviceTypeException implements Exception {
  String message;

  DeviceTypeException(this.message);
 
  @override
  String toString() {
    return "Error message: $message";
  }
}
