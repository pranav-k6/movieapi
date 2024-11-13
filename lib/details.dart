// import 'package:flutter/material.dart';
// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:moviecast/modelclass.dart';


// class Details extends StatefulWidget {
//   const Details({super.key, required this.datas});
//   final DetailsMov datas;

//   @override
//   State<Details> createState() => _DetailsState();
// }

// class _DetailsState extends State<Details> {

//   @override
//   Widget build(BuildContext context,) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: 400,
//             width: double.infinity,
//             decoration: BoxDecoration(
                
//                 image: DecorationImage(image: NetworkImage(dataa.image!.toString())),
//             ),
            
           
//           ),
       
//           SizedBox(
//             height: 20,
//           ),
       
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:moviecast/cast.dart';
import 'package:moviecast/modelclass.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.datas});
  final DetailsMov datas;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: 
    AppBar(automaticallyImplyLeading: false,
  leading: IconButton(onPressed: (){
    Navigator.pop(context);
  }, icon: Icon(Icons.arrow_back)),),
      
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.datas.image?.medium ?? '', 
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
               SizedBox(height: 20),
              Text(
                widget.datas.name ?? '', 
                style:  TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
              
              SizedBox(
                height: 10,
              ),
              Text(widget.datas.summary??'',
              style: TextStyle(fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white),),
              SizedBox(height: 20,),
              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cast(Casted: widget)));
              },
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: Center(
                    child: Text("Cast",style: TextStyle(
                      // fontWeight: FontWeight.w600,
                      color: Colors.black,
                    
                    ),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
