import 'dart:ffi';

class WeatherModel {
  Location? location;
  Current? current;

  WeatherModel({this.location, this.current});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    return data;
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location(
      {this.name,
      this.region,
      this.country,
      this.tzId,
      this.localtimeEpoch,
      this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['region'] = this.region;
    data['country'] = this.country;
    data['tz_id'] = this.tzId;
    data['localtime_epoch'] = this.localtimeEpoch;
    data['localtime'] = this.localtime;
    return data;
  }
}

class Current {
  double? tempC;
  int? isDay;
  Condition? condition;
  double? windKph;
  double? precipMm;
  int? humidity;
  double? uv;

  Current(
      {this.tempC,
      this.isDay,
      this.condition,
      this.windKph,
      this.precipMm,
      this.humidity,
      this.uv});

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'];
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
    windKph = json['wind_kph'];
    precipMm = json['precip_mm'];
    humidity = json['humidity'];
    uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp_c'] = this.tempC;
    data['is_day'] = this.isDay;
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
    }
    data['wind_kph'] = this.windKph;
    data['precip_mm'] = this.precipMm;
    data['humidity'] = this.humidity;
    data['uv'] = this.uv;
    return data;
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['icon'] = this.icon;
    data['code'] = this.code;
    return data;
  }
}