class RoomInvite {
  final String inviteId;
  final String secret;

  RoomInvite({
    required this.inviteId,
    required this.secret,
  });

  factory RoomInvite.fromJson(Map<String, dynamic> json) {
    return RoomInvite(
      inviteId: json["invite_id"],
      secret: json["secret"],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["invite_id"] = inviteId;
    data["secret"] = secret;
    return data;
  }
}
