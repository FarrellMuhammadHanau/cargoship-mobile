// To parse this JSON data, do
//
//     final cargoContainer = cargoContainerFromJson(jsonString);

import 'dart:convert';

List<CargoContainer> cargoContainerFromJson(String str) => List<CargoContainer>.from(json.decode(str).map((x) => CargoContainer.fromJson(x)));

String cargoContainerToJson(List<CargoContainer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CargoContainer {
    String model;
    int pk;
    Fields fields;

    CargoContainer({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory CargoContainer.fromJson(Map<String, dynamic> json) => CargoContainer(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;

    Fields({
        required this.user,
        required this.name,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
    };
}
