class Message {
  final String? message;
  final String? messageDateTime; // Renamed the field

  Message({
    required this.messageDateTime, // Updated the constructor parameter
    required this.message,
  });

  factory Message.fromJson(JsonData) {
    return Message(
      message: JsonData['message'],
      messageDateTime: JsonData['DateTime'], // Updated the field access
    );
  }
}
