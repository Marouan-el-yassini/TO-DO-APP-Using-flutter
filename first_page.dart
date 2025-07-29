import 'package:flutter/material.dart';
import 'package:login_proj/Login_page.dart';

void main() {
  runApp(const firstPage());
}

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  List<bool> _visibleLetters =List.generate(9, (_) => false);

  void _animationLetters() async{
    for(int i=0 ; i < _visibleLetters.length;i++){
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        _visibleLetters[i]=true;
      });
    }
  }
  void _gotoLoginPage() async{
    await Future.delayed(const Duration(seconds: 8));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context)  => const LoginPage()),
    );
  }

  @override
  void initState(){
    super.initState();
    _animationLetters();
    _gotoLoginPage();
  }


  @override
  Widget build(BuildContext context) {
    List<String> letters=['T','O','','D','O','','A','P','P'];
    List<Color?> colors=[
      Colors.deepPurple[900],
      Colors.deepPurple[800],
      Colors.black87,
      Colors.deepPurple[600],
      Colors.deepPurple[500],
      Colors.black87,
      Colors.deepPurple[400],
      Colors.deepPurple[300],
      Colors.deepPurple[200],
    ];

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(letters.length, (index){
            if (letters[index].isEmpty) {
              return const SizedBox(width: 20); // espace entre les mots
            }
            return AnimatedOpacity(
                opacity: _visibleLetters[index] ? 1.0:0.0 ,
                duration: const Duration(milliseconds: 500),
               child: Text(
                 letters[index],
                 style: TextStyle(
                   fontSize: 48,
                   fontWeight: FontWeight.bold,
                   color: colors[index],
                 ),
               ),
            );
          }),
        ),
      ),
    );
  }
}