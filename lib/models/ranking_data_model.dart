// To parse this JSON data, do
//
//     final rankingDataModel = rankingDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:cric_stats/models/player.dart';
import 'package:cric_stats/models/team.dart';

RankingDataModel rankingDataModelFromJson(String str) => RankingDataModel.fromJson(json.decode(str));

String rankingDataModelToJson(RankingDataModel data) => json.encode(data.toJson());

class RankingDataModel {
  int? statusCode;
  ResponseData? responseData;

  RankingDataModel({
    this.statusCode,
    this.responseData,
  });

  RankingDataModel copyWith({
    int? statusCode,
    ResponseData? responseData,
  }) =>
      RankingDataModel(
        statusCode: statusCode ?? this.statusCode,
        responseData: responseData ?? this.responseData,
      );

  factory RankingDataModel.fromJson(Map<String, dynamic> json) => RankingDataModel(
    statusCode: json["statusCode"],
    responseData: json["responseData"] == null ? null : ResponseData.fromJson(json["responseData"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "responseData": responseData?.toJson(),
  };
}

class ResponseData {
  String? message;
  Result? result;

  ResponseData({
    this.message,
    this.result,
  });

  ResponseData copyWith({
    String? message,
    Result? result,
  }) =>
      ResponseData(
        message: message ?? this.message,
        result: result ?? this.result,
      );

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
    message: json["message"],
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "result": result?.toJson(),
  };
}

class Result {
  List<Team>? odiTeams;
  List<Team>? testTeams;
  List<Team>? t20Teams;
  List<Player>? odiBatsman;
  List<Player>? odiBowler;
  List<Player>? odiAllRounder;
  List<Player>? testBatsman;
  List<Player>? testBowler;
  List<Player>? testAllRounder;
  List<Player>? t20Batsman;
  List<Player>? t20Bowler;
  List<Player>? t20AllRounder;

  Result({
    this.odiTeams,
    this.testTeams,
    this.t20Teams,
    this.odiBatsman,
    this.odiBowler,
    this.odiAllRounder,
    this.testBatsman,
    this.testBowler,
    this.testAllRounder,
    this.t20Batsman,
    this.t20Bowler,
    this.t20AllRounder,
  });

  Result copyWith({
    List<Team>? odiTeams,
    List<Team>? testTeams,
    List<Team>? t20Teams,
    List<Player>? odiBatsman,
    List<Player>? odiBowler,
    List<Player>? odiAllRounder,
    List<Player>? testBatsman,
    List<Player>? testBowler,
    List<Player>? testAllRounder,
    List<Player>? t20Batsman,
    List<Player>? t20Bowler,
    List<Player>? t20AllRounder,
  }) =>
      Result(
        odiTeams: odiTeams ?? this.odiTeams,
        testTeams: testTeams ?? this.testTeams,
        t20Teams: t20Teams ?? this.t20Teams,
        odiBatsman: odiBatsman ?? this.odiBatsman,
        odiBowler: odiBowler ?? this.odiBowler,
        odiAllRounder: odiAllRounder ?? this.odiAllRounder,
        testBatsman: testBatsman ?? this.testBatsman,
        testBowler: testBowler ?? this.testBowler,
        testAllRounder: testAllRounder ?? this.testAllRounder,
        t20Batsman: t20Batsman ?? this.t20Batsman,
        t20Bowler: t20Bowler ?? this.t20Bowler,
        t20AllRounder: t20AllRounder ?? this.t20AllRounder,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    odiTeams: json["odiTeams"] == null ? [] : List<Team>.from(json["odiTeams"]!.map((x) => Team.fromJson(x))),
    testTeams: json["testTeams"] == null ? [] : List<Team>.from(json["testTeams"]!.map((x) => Team.fromJson(x))),
    t20Teams: json["t20Teams"] == null ? [] : List<Team>.from(json["t20Teams"]!.map((x) => Team.fromJson(x))),
    odiBatsman: json["odiBatsman"] == null ? [] : List<Player>.from(json["odiBatsman"]!.map((x) => Player.fromJson(x))),
    odiBowler: json["odiBowler"] == null ? [] : List<Player>.from(json["odiBowler"]!.map((x) => Player.fromJson(x))),
    odiAllRounder: json["odiAllRounder"] == null ? [] : List<Player>.from(json["odiAllRounder"]!.map((x) => Player.fromJson(x))),
    testBatsman: json["testBatsman"] == null ? [] : List<Player>.from(json["testBatsman"]!.map((x) => Player.fromJson(x))),
    testBowler: json["testBowler"] == null ? [] : List<Player>.from(json["testBowler"]!.map((x) => Player.fromJson(x))),
    testAllRounder: json["testAllRounder"] == null ? [] : List<Player>.from(json["testAllRounder"]!.map((x) => Player.fromJson(x))),
    t20Batsman: json["t20Batsman"] == null ? [] : List<Player>.from(json["t20Batsman"]!.map((x) => Player.fromJson(x))),
    t20Bowler: json["t20Bowler"] == null ? [] : List<Player>.from(json["t20Bowler"]!.map((x) => Player.fromJson(x))),
    t20AllRounder: json["t20AllRounder"] == null ? [] : List<Player>.from(json["t20AllRounder"]!.map((x) => Player.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "odiTeams": odiTeams == null ? [] : List<dynamic>.from(odiTeams!.map((x) => x.toJson())),
    "testTeams": testTeams == null ? [] : List<dynamic>.from(testTeams!.map((x) => x.toJson())),
    "t20Teams": t20Teams == null ? [] : List<dynamic>.from(t20Teams!.map((x) => x.toJson())),
    "odiBatsman": odiBatsman == null ? [] : List<dynamic>.from(odiBatsman!.map((x) => x.toJson())),
    "odiBowler": odiBowler == null ? [] : List<dynamic>.from(odiBowler!.map((x) => x.toJson())),
    "odiAllRounder": odiAllRounder == null ? [] : List<dynamic>.from(odiAllRounder!.map((x) => x.toJson())),
    "testBatsman": testBatsman == null ? [] : List<dynamic>.from(testBatsman!.map((x) => x.toJson())),
    "testBowler": testBowler == null ? [] : List<dynamic>.from(testBowler!.map((x) => x.toJson())),
    "testAllRounder": testAllRounder == null ? [] : List<dynamic>.from(testAllRounder!.map((x) => x.toJson())),
    "t20Batsman": t20Batsman == null ? [] : List<dynamic>.from(t20Batsman!.map((x) => x.toJson())),
    "t20Bowler": t20Bowler == null ? [] : List<dynamic>.from(t20Bowler!.map((x) => x.toJson())),
    "t20AllRounder": t20AllRounder == null ? [] : List<dynamic>.from(t20AllRounder!.map((x) => x.toJson())),
  };
}