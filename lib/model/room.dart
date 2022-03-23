class Room {
  final String id;
  final String owner;
  final String name;
  final String iv;

  Room({
    required this.id,
    required this.owner,
    required this.name,
    required this.iv,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json["id"],
      owner: json["owner"],
      name: json["name"],
      iv: json["iv"],
    );
  }
}
