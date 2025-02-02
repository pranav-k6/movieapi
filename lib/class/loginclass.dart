// To parse this JSON data, do
//
//     final postApp = postAppFromJson(jsonString);



import 'dart:convert';

PostApp postAppFromJson(String str) => PostApp.fromJson(json.decode(str));

String postAppToJson(PostApp data) => json.encode(data.toJson());

class PostApp {
    bool? success;
    dynamic data;
    String? message;
    String? errors;

    PostApp({
        this.success,
        this.data,
        this.message,
        this.errors,
    });

    factory PostApp.fromJson(Map<String, dynamic> json) => PostApp(
        success: json["success"],
        data: json["data"],
        message: json["message"],
        errors: json["errors"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data,
        "message": message,
        "errors": errors,
    };
}
