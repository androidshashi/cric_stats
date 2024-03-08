class Player {
  String? playerName;
  int? position;
  int? points;
  String? team;
  int? matchType;
  int? playerType;
  int? status;

  Player({
    this.playerName,
    this.position,
    this.points,
    this.team,
    this.matchType,
    this.playerType,
    this.status,
  });

  Player copyWith({
    String? playerName,
    int? position,
    int? points,
    String? team,
    int? matchType,
    int? playerType,
    int? status,
  }) =>
      Player(
        playerName: playerName ?? this.playerName,
        position: position ?? this.position,
        points: points ?? this.points,
        team: team ?? this.team,
        matchType: matchType ?? this.matchType,
        playerType: playerType ?? this.playerType,
        status: status ?? this.status,
      );

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    playerName: json["player_name"],
    position: json["position"],
    points: json["points"],
    team: json["team"],
    matchType: json["match_type"],
    playerType: json["player_type"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "player_name": playerName,
    "position": position,
    "points": points,
    "team": team,
    "match_type": matchType,
    "player_type": playerType,
    "status": status,
  };
}