import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart 'as http;
import 'package:moviecast/movie.dart';


class Login extends StatefulWidget {
   Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   TextEditingController Email=TextEditingController();

   TextEditingController password=TextEditingController();

   final formkey=GlobalKey<FormState>();


   Future<void>login()async{
    final url="https://crm-beta-api.vozlead.in/api/v2/account/login/";
    final response=await http.post(Uri.parse(url),headers:<String,String> {
      'Content-Type': 'application/json',
      
    },
    body: jsonEncode({"email":Email.text,
    "password":password.text})
    );
    if(response.statusCode==200){
      final res=jsonDecode(response.body);
      final postapp=PostApp.fromJson(res);
      if(postapp.success==true){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("login succesfully,${postapp.message}"))
        );
        
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(postapp.errors?? "login failed"))
        );
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("login failed"))
      );
    }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: Email,
              validator: (value){
                if(value!.contains("@")){
                  return null;
                }
                return "incorrect email";
              },
              decoration: InputDecoration(
                hintText: "Enter the Email"
              ),
        
            ),
            TextFormField(
                controller: password,
                validator: (value){
                  if(value!.length<8){
                    return "minimum 8 charatcter";
                  }
                  return null;
                },
                  
              
                decoration:  InputDecoration(hintText: 'Enter the Password'),
              ),
              SizedBox(height: 10,),
              InkWell(onTap: () {
                if(formkey.currentState!.validate()){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Movie()));

                }
                
              },
                child: Container(
                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(child: Text("Sign in",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),)),
                ),
              )
          ],
        ),
      ),
    );
  }
}

// To parse this JSON data, do
//
//     final postApp = postAppFromJson(jsonString);





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

