class Message {
  final String? message;
  final dynamic DateTime; // Renamed the field
  final String? id;

  Message(
      {required this.DateTime, // Updated the constructor parameter
      required this.message,
      required this.id});

  factory Message.fromJson(JsonData) {
    return Message(
      message: JsonData['message'],
      DateTime: JsonData['DateTime'], // Updated the field access
      id: JsonData['id'],
    );
  }
}
