import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(
  home:Home(),
));

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESUME', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 240, 240, 238),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 50.0),
        child: Column(
          children: [
           Row(
            children:<Widget>[
              CircleAvatar(radius:80 ,  backgroundImage: AssetImage("image/img.jpg")),
              SizedBox(width: 30,),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rani S Chavan", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                  Text("Java  Intern", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ],
               ),
            ],
           ),
           SizedBox(height: 20,),
           Column(
                children: <Widget>[
                  Row(children: [
                    Icon(Icons.school, size: 40,),
                    SizedBox(width:20),
                    Text("BE in Civil Graduated [2022], PDA College of Engineering, Kalaburgi.", style: TextStyle(fontSize: 20),)
                  ],),
                  SizedBox(height: 10,),
                   Row(children: [
                    Icon(Icons.business_center,size: 40,),
                    SizedBox(width:20),
                    Text(" 1] E-Market, 2] Student Management System using Spring boot.", 
                    style: TextStyle(fontSize: 20),)
                  ],),
                   SizedBox(height: 10,),
                    Row(children: [
                    Icon(Icons.email,size: 40,),
                    SizedBox(width:20),
                    Text("ranichavan109@gmail.com", style: TextStyle(fontSize: 20),)
                  ],),
                   SizedBox(height: 10,),
                     Row(children: [
                    Icon(Icons.phone,size: 40,),
                    SizedBox(width:20),
                    Text("9731118984", style: TextStyle(fontSize: 20),)
                  ],),
                   SizedBox(height: 10,),
                      Row(children: [
                    Icon(Icons.location_pin, size: 40,),
                    SizedBox(width:20),
                    Text("Mahadev Nagar Near Banashankari School, Kalaburgi.", style: TextStyle(fontSize: 20),)
                  ],),
                ],
               ), 
                SizedBox(height: 30,),
               Text('About Me', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
               Center(child: Text(" Seeking  a challenging role in the IT industry where I can leverage my technical knowledge, hard work, and commitment towards the organization to add value and help achieve the company's goals by effectively working with deadlines and overcoming challenges.", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal ),)),
                SizedBox(height: 30,),
               Text('Create by Rani S Chavan'),
          ],
        ), 
      )
    );
  }
}