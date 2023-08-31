import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(52, 63, 75, 100),
        centerTitle: true,
        title: Text('Elden Bild'),
        foregroundColor: Color.fromRGBO(253, 245, 4, 1),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Cambia el color del fondo aquí
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromARGB(246, 255, 198, 0),
        color: Color.fromARGB(255, 0, 0, 0),
        activeColor: Color.fromARGB(255, 0, 0, 0),
        tabBackgroundColor: Color.fromARGB(255, 255, 255, 0),
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'homes',
          ),
          GButton(
            icon: Icons.account_circle_rounded,
            text: 'caracter',
          ),
          GButton(
            icon: Icons.colorize_sharp,
            text: 'weapons',
          ),
        ],
      ),
    );
  }
}
