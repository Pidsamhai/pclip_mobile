class Room {
  final String uid;
  final String owner;
  final String name;

  Room({
    required this.uid,
    required this.owner,
    required this.name,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(uid: json["uid"], owner: json["owner"], name: json["name"]);
  }
}
