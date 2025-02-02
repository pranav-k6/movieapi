// import 'package:flutter/material.dart';

// class Cast extends StatelessWidget {
//   const Cast({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView.builder(
//               itemCount: 2,
              
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,
//                             crossAxisSpacing: 5),
//            itemBuilder:(context,index){
//             return Container(),
          

//            }
           
//             )
//             ),
       
          

         
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class Cast extends StatelessWidget {
//   const Cast({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView.builder(
//               itemCount: 4, 
//               gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 5,
//                 crossAxisSpacing: 5,
//               ),
//               itemBuilder: (context, index) {
//                 return Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.amber,
                  
//                 )
                
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moviecast/castmodel.dart';

class Cast extends StatefulWidget {
  const Cast({super.key, required this.userid});
  // final dynamic casted;
  final dynamic userid;

  @override
  State<Cast> createState() => _CastState();
}

class _CastState extends State<Cast> {
  
  Future<List<CastDetails>?> castdet(int id) async {
    var url = "https://api.tvmaze.com/shows/$id/cast";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      List<CastDetails> castlist = (res as List).map((show) {
        return CastDetails.fromJson(show);
      }).toList();
      return castlist;
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<List<CastDetails>?>(
        future: castdet(widget.userid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Failed: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            List<CastDetails>? castlistdet = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: castlistdet.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  castlistdet[index].person?.image?.medium ??
                                      '',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            castlistdet[index].person?.name ?? 'Unknown',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text("Error loading data"));
          }
        },
      ),
    );
  }
}

// Model Classes

class CastDetails {
  Person? person;
  Character? character;
  bool? self;
  bool? voice;

  CastDetails({
    this.person,
    this.character,
    this.self,
    this.voice,
  });

  factory CastDetails.fromJson(Map<String, dynamic> json) => CastDetails(
        person: json["person"] == null ? null : Person.fromJson(json["person"]),
        character:
            json["character"] == null ? null : Character.fromJson(json["character"]),
        self: json["self"],
        voice: json["voice"],
      );

  Map<String, dynamic> toJson() => {
        "person": person?.toJson(),
        "character": character?.toJson(),
        "self": self,
        "voice": voice,
      };
}

class Character {
  int? id;
  String? url;
  String? name;
  Image? image;
  Links? links;

  Character({
    this.id,
    this.url,
    this.name,
    this.image,
    this.links,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "image": image?.toJson(),
        "_links": links?.toJson(),
      };
}

class Image {
  String? medium;
  String? original;

  Image({
    this.medium,
    this.original,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
      );

  Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
      };
}

// Add other classes (Links, Self, Person, Country) similarly.
