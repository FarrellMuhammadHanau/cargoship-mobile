// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
    String model;
    int pk;
    Fields fields;

    Item({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
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
    String owner;
    String type;
    int amount;
    double weight;
    int container;
    String description;

    Fields({
        required this.user,
        required this.name,
        required this.owner,
        required this.type,
        required this.amount,
        required this.weight,
        required this.container,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        owner: json["owner"],
        type: json["type"],
        amount: json["amount"],
        weight: json["weight"]?.toDouble(),
        container: json["container"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "owner": owner,
        "type": type,
        "amount": amount,
        "weight": weight,
        "container": container,
        "description": description,
    };
}
