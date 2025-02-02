import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:moviecast/modelclass.dart';
import 'package:moviecast/details.dart';

class Movie extends StatefulWidget {
  const Movie({super.key});

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {


   Future<List<DetailsMov>>moviee() async {
        var url="https://api.tvmaze.com/shows";
        var response=await http.get(Uri.parse(url));
        if(response.statusCode==200){
             var res=jsonDecode(response.body);
             List<DetailsMov>listmovie=(res as List).map((show){
                return DetailsMov.fromJson(show);
             }).toList();
             return listmovie;
        }else{
            throw Exception("error");
        }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
        appBar: AppBar(
          title: Center(
            child: Text(
              "Movies",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: FutureBuilder<List<DetailsMov>?>(
          future: moviee(),
          builder: (context,snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }else if(snapshot.hasError){
              return Text("fail:${snapshot.hasError}");
            }else if(snapshot.hasData){
              List<DetailsMov>?movielist=snapshot.data;


              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        itemCount: movielist!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                        itemBuilder: (context, index) {
                          
                          return Container(
                            height: 120,
                            width: 120,
                            
                            child: Stack(
                              children: [
                               
                                Positioned(
                                    left: 75,
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 150,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(movielist[index].image!.medium.toString()),)
                                            )),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          movielist[index].name.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            movielist[index].image!.medium.toString();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Details(datas:snapshot.data![index])));
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white),
                                            child: Center(child: Text("Watch Now")),
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            }else {
              return Text("not found");
            }
          }
        ));
  }
}
