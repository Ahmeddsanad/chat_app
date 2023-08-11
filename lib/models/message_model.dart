// ignore_for_file: non_constant_identifier_names

class Message {
  final String? message;
  final dynamic DateTime; // Renamed the field
  final String? id;
  final dynamic formattedTime;

  Message(
      {required this.DateTime, // Updated the constructor parameter
      required this.message,
      required this.id,
      required this.formattedTime});

  factory Message.fromJson(JsonData) {
    return Message(
        message: JsonData['message'],
        DateTime: JsonData['DateTime'], // Updated the field access
        id: JsonData['id'],
        formattedTime: JsonData['formattedTime']);
  }
}
