import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_proj/Seconde_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:login_proj/first_page.dart';


void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // This widget is the root of your application.

  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();

  void _Login() {
    if (username.text == "Marwan" && password.text == "azerty123") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SecondePage()));
    }

    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Wrong username or password")),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          "To Do App",
          style: TextStyle(
            color: Colors.deepPurple[200],
            fontSize: 29,
          ),
        ),
        centerTitle: true,
        elevation: 6,
        leading: Icon(Icons.menu,color: Colors.white,),
        actions: [
          ElevatedButton(onPressed: (){SystemNavigator.pop();}, child: Icon(Icons.exit_to_app,color: Colors.white,),style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent
          ),)
        ],
        

      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF0D0511),
        child: Column(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "About Me",
                        style: TextStyle(
                          color: Colors.deepPurple[100],
                          fontSize: 22
                        ),

                      ),
                      SizedBox(height: 20),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/Me.JPG'),
                      ),

                    ],
                  ),
                 ),

            SizedBox(height: 40,),

            ListTile(
              leading: Icon(Icons.person,color: Colors.white,),
              title: Text("Marouan El Yassini --18",style: TextStyle(
                color: Colors.deepPurple[100],
              ),
              ),
            ),

            SizedBox(height: 20,),

            ListTile(
              leading: FaIcon(FontAwesomeIcons.github, color: Colors.white),
              title: Text(
                "GitHub",
                style: TextStyle(color: Colors.deepPurple[100]),
              ),
              onTap: () async {
                final Uri url = Uri.parse('https://github.com/Marouan-el-yassini');
                if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                  throw 'Could not launch $url';
                }
              },
            ),

            SizedBox(height: 20,),

            ListTile(
              leading: FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
              title: Text(
                "Linkedln",
                style: TextStyle(color: Colors.deepPurple[100]),
              ),
              onTap: () async {
                final Uri url = Uri.parse('https://www.linkedin.com/in/marouan-el-yassini-b88a43333/');
                if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                  throw 'Could not launch $url';
                }
              },
            )


          ],
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 0),
              Text(
                    "Login,Page",
                    style: TextStyle(
                      color: Colors.deepPurple[200],
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              SizedBox(height: 50,),
              TextField(
                controller: username,

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                  hintText: "Enter Username",
                  hintStyle: TextStyle(
                    color: Colors.black87,
                  ),
                  fillColor: Colors.deepPurple[200],
                  filled: true,

                ),


              ),
              SizedBox(height: 40,),
              TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.deepPurple),
              ),
              hintText: "Enter Password",

              hintStyle: TextStyle(
                color: Colors.black87,
              ),
              fillColor: Colors.deepPurple[200],
              filled: true,


            ),),
              SizedBox(height: 50,),
              ElevatedButton(
                  onPressed: _Login ,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[200],
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                  child: Text("Submit",style: TextStyle(color: Colors.black87),)
              )
            ],
          ),
        )
      ),
    );
  }
}
