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
import 'package:moviecast/castmodel.dart';
import 'package:moviecast/modelclass.dart';
import 'package:http/http.dart'as http;

class Cast extends StatefulWidget {
  const Cast({super.key,required this.Casted});
  final Casted ;
  

  @override
  State<Cast> createState() => _CastState();
}

class _CastState extends State<Cast> {
  // get castlistdet => null;

   Future<List<CastDetails>?>castdet() async {
        var url="https://api.tvmaze.com/shows/1/cast";
        var response=await http.get(Uri.parse(url));
        if(response.statusCode==200){
             var res=jsonDecode(response.body);
             List<CastDetails>castlist=(res as List).map((show){
                return CastDetails.fromJson(show);
             }).toList();
             return castlist;
        }else{
            throw Exception("error");
        }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<List<CastDetails>?>(
        future: castdet(),
        builder: (context,snapshot) {
          if (snapshot.connectionState==ConnectionState.waiting){
            return CircularProgressIndicator();
          }else if(snapshot.hasError){
            return Text("failed:${snapshot.hasError}");
          }else if(snapshot.hasData){
            List<CastDetails>?castlistdet=snapshot.data!;
            return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: 10, 
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
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
                            image: DecorationImage(image: NetworkImage(castlistdet[index].character!.image!.medium.toString()))
                          ),
                          
                        ),
                         SizedBox(height: 8), 
                         Text(
                          castlistdet[index].character!.name.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
          }else{
            return Text("error");
          }
          
        }
      ),
    );
  }
}



