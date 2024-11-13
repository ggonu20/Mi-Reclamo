class Category {
  final String token;
  final String name;
  final String description;

  Category({
    required this.token,
    required this.name,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      token: json['token'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'name': name,
      'description': description,
    };
  }
  @override
  String toString() {
    return 'Category{token: $token, name: $name, description: $description}';
  }
}

class Ticket {
  final String type;
  final String subject;
  final String message;
  final Category category;
  final String token;
  final String status;
  final DateTime created;
  final DateTime updated;

  Ticket({
    required this.type,
    required this.subject,
    required this.message,
    required this.category,
    required this.token,
    required this.status,
    required this.created,
    required this.updated,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      type: json['type'],
      subject: json['subject'],
      message: json['message'],
      category: Category.fromJson(json['category']),
      token: json['token'],
      status: json['status'],
      created: DateTime.parse(json['created']),
      updated: DateTime.parse(json['updated']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'subject': subject,
      'message': message,
      'category': category.toJson(),
      'token': token,
      'status': status,
      'created': created.toIso8601String(),
      'updated': updated.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Ticket{type: $type, subject: $subject, message: $message, category: ${category.toString()}, token: $token, status: $status, created: $created, updated: $updated}';
  }

}