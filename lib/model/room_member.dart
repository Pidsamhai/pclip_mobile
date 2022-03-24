class RoomMember {
  final String roomId;
  final String memberId;
  final String deviceName;

  RoomMember({
    required this.roomId,
    required this.memberId,
    required this.deviceName,
  });

  factory RoomMember.fromJson(Map<String, dynamic> json) {
    return RoomMember(
        roomId: json["room_id"],
        memberId: json["member_id"],
        deviceName: json["device_name"]);
  }
}
