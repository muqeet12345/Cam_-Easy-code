
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwipScreen extends StatefulWidget{
  @override
  SwipeWidget createState() => SwipeWidget();
}

class SwipeWidget extends State<SwipScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Plant App',
       style: TextStyle(
         color: Colors.white
       ),),
       centerTitle: true,
       backgroundColor: Colors.blue.shade700,
       leading: Icon(Icons.menu),
       actions: [
         Padding(padding: EdgeInsets.all(10),
      child:    Icon(Icons.shopping_cart),
    )
       ],
     ),
     body: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Padding(
           padding: EdgeInsets.all(8.0),
           child: Row(
             children: [
               // Search Bar
               Expanded(
                 child: TextField(
                   decoration: InputDecoration(
                     hintText: "Search...",
                     prefixIcon: Icon(Icons.search),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(0), // Rectangular border
                     ),
                   ),
                 ),
               ),

               SizedBox(width: 10), // Space between search bar and filter icon
               // Filter Icon Button
               Container(
                 decoration: BoxDecoration(
                   border: Border.all(color: Colors.grey),
                   borderRadius: BorderRadius.circular(5), // Slightly rounded edges
                 ),
                 child: IconButton(
                   onPressed: () {
                     print("Filter Clicked");
                   },
                   icon: Icon(Icons.filter_list), // Three-line filter icon
                 ),
               ),
             ],
           ),
         ),

         // Your existing widgets below
       ],
     ),

   );
  }

}