import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var arrName = ["Happy" , "Spiderman", "Tony" , "Peter" , "Doctor Strange"];

  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Center(child: Text("Home", style: TextStyle(color: Colors.white),)),
        leading: Icon(Icons.menu, color: Colors.white,),
        actions: const [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.notifications_outlined, color: Colors.white,),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.settings, color: Colors.white,),
              ),
            ],
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // **ADD Buttons**
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () => print('Button Tapped!'),
                      child: Text("Text Button"),),
                    ElevatedButton(onPressed: () => print('Elevated Button Tapped!'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent,
                        foregroundColor: Colors.white
                    ),
                      child: Text('Elevated Button'),),
                    OutlinedButton(onPressed: () => print('OutLined Button Pressed!'),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          elevation: 2,
                          shadowColor: Colors.yellowAccent
                        ),
                        child: Text('Outline Button'))
                  ],
                ),
              ),
            ),

            // **ADD Images**
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("lib/assets/images/bike.jpg",
                    width: 150,
                    height: 150,
                  ),
                  Image.network("https://images.unsplash.com/photo-1611873189125-324514ebd94e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
                  width: 150,
                    height: 150,
                  )
                ],
              )
            ),

            // **ListView and ListView Builder**
            Container(
              width: double.infinity,
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(width: 150, height: 30, color: Colors.lightGreenAccent, margin: EdgeInsets.symmetric(horizontal: 10),),
                  Container(width: 150, height: 30, color: Colors.blue, margin: EdgeInsets.symmetric(horizontal: 10),),
                  Container(width: 150, height: 30, color: Colors.redAccent, margin: EdgeInsets.symmetric(horizontal: 10),)
                ],
              ),
            ),
              SizedBox(height: 10,),
              // =>>> List View Builder
            Container(
              width: double.infinity,
              height: 40,
              child: ListView.builder(itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(arrName[index], style: TextStyle(fontSize: 20, backgroundColor: Colors.deepOrangeAccent, color: Colors.white),),
                );
              },itemCount: arrName.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            // =>>> List View Seperated
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepOrangeAccent,
                  width: 2
                ),
                borderRadius: BorderRadius.circular(10),

              ),
              width: double.infinity,
              height: 150,
              child: ListView.separated(itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("$index"),
                  title: Text(arrName[index]),
                  subtitle: Text("Number"),
                  trailing: Icon(Icons.add),
                );
              }, separatorBuilder: (context, index) {
                return Divider(thickness: 2, color: Colors.deepOrangeAccent,);
              }, itemCount: arrName.length),
            ),
            
            // **Circle Avatar**
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: 10),
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80"),
              )
            ),

            // **Custom Font**
            Container(
              height: 35,
              width: double.infinity,
              child: Text("Hello World!", textAlign: TextAlign.center, style: TextStyle(
                  fontFamily: "TiltPrism",
                  fontSize: 30,
                color: Colors.deepOrangeAccent,
              ),),
            ),
            // **Input TextField**
            Container(
              width: double.infinity,
              height: 100,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Enter Your Name",
                       labelStyle: TextStyle(color: Colors.deepOrangeAccent),
                       suffixIcon: Icon(Icons.email, color: Colors.deepOrangeAccent),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.deepOrangeAccent
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.deepOrangeAccent
                        )
                      )
                      )
                    ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
