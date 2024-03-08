class Team {
  String? teamName;
  int? position;
  int? points;
  int? rating;
  int? matches;
  int? matchType;
  int? status;

  Team({
    this.teamName,
    this.position,
    this.points,
    this.rating,
    this.matches,
    this.matchType,
    this.status,
  });

  Team copyWith({
    String? teamName,
    int? position,
    int? points,
    int? rating,
    int? matches,
    int? matchType,
    int? status,
  }) =>
      Team(
        teamName: teamName ?? this.teamName,
        position: position ?? this.position,
        points: points ?? this.points,
        rating: rating ?? this.rating,
        matches: matches ?? this.matches,
        matchType: matchType ?? this.matchType,
        status: status ?? this.status,
      );

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    teamName: json["team_name"],
    position: json["position"],
    points: json["points"],
    rating: json["rating"],
    matches: json["matches"],
    matchType: json["match_type"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "team_name": teamName,
    "position": position,
    "points": points,
    "rating": rating,
    "matches": matches,
    "match_type": matchType,
    "status": status,
  };
}