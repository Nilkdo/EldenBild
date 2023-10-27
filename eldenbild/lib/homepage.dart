import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color.fromRGBO(52, 63, 75, 1), // Cambia el color de la barra de navegación
      ),
    ),
    home: const HomePage(),
    onGenerateRoute: (settings) {
      if (settings.name == WeaponsPage.routeName) {
        return MaterialPageRoute(builder: (context) => const WeaponsPage());
      } else if (settings.name == CharactersPage.routeName) {
        return MaterialPageRoute(builder: (context) => const CharactersPage());
      }
      return null;
    },
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = <Widget>[
    const HomeContent(),
    const CharactersPage(),
    const WeaponsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Elden Bild'),
        foregroundColor: const Color.fromRGBO(253, 245, 4, 1),
        backgroundColor: const Color.fromRGBO(52, 63, 75, 1),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Personajes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_kabaddi),
            label: 'Armas',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: const Color.fromARGB(255, 166, 125, 1),
        unselectedItemColor: const Color.fromARGB(255, 166, 125, 1),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color.fromRGBO(52, 63, 75, 1), // Cambia el color de fondo de la barra de navegación inferior a negro
      ),
      backgroundColor: Colors.black, // Establece el fondo de la pantalla principal en negro
    );
  }
}


class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Container(

            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
              color: const Color.fromARGB(255, 198, 155, 0),
              //child: Image.asset('assets/imagen1.png'), // Agrega la imagen aquí
            ),
          ),
          const Text(
            "Ten en cuenta que la aplicación está orientada para principiantes, no se dan estadísticas específicas para no quitar libertad al jugador",
            style: TextStyle(color: Colors.amber),
          ),
          const ExpansionTileWidget(
            'Build de fuerza suprema',
            Colors.red,
            [00.0, 300.0, 20.0, 250.0, 350.0, 200.0, 50.0, 10.0],
          ),
          const ExpansionTileWidget(
            'Build de versatilidad: cuerpo a cuerpo + distancia',
            Colors.yellow,
            [00.0, 250.0, 10.0, 200.0, 150.0, 90.0, 200.0, 10.0],
          ),
          const ExpansionTileWidget(
            'Build de cuerpo a cuerpo + magia',
            Colors.blue,
            [00.0, 200.0, 170.0, 60.0, 16.0, 90.0, 200.0, 10.0],
          ),
          const ExpansionTileWidget(
            'Build de magia equilibrada',
            Colors.purple,
            [00.0, 170.0, 190.0, 80.0, 50.0, 50.0, 200.0, 200.0],
          ),
          const ExpansionTileWidget(
            'Build de magia suprema',
            Colors.pink,
            [00.0, 150.0, 300.0, 150.0, 50.0, 20.0, 250.0, 300.0],
          ),
          const ExpansionTileWidget(
            'Mejor build para la clase Guerrero',
            Colors.cyan,
            [00.0, 250.0, 30.0, 150.0, 250.0, 200.0, 20.0, 30.0],
          ),
          const ExpansionTileWidget(
            'Mejor build para la clase Héroe',
            Color.fromARGB(255, 141, 7, 7),
            [00.0, 250.0, 20.0, 250.0, 350.0, 200.0, 20.0, 30.0],
          ),
          const ExpansionTileWidget(
            'Mejor build para la clase Confesor',
            Colors.orange,
            [00.0, 250.0, 150.0, 50.0, 10.0, 60.0,200.0, 200.0],
          ),
        ],
      ),
    );
  }
}


class ExpansionTileWidget extends StatefulWidget {
  final String title;
  final Color textColor;
  final List<double> containerWidths;

  const ExpansionTileWidget(this.title, this.textColor, this.containerWidths, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExpansionTileWidgetState createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: isExpanded ? Colors.black : Colors.transparent,
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(color: Color.fromARGB(255, 198, 155, 0)),
                ),
                Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          for (var i = 0; i < widget.containerWidths.length; i++)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: widget.containerWidths[i],
                    height: 20.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: const Color.fromARGB(255, 137, 3, 3),
                    ),
                    margin: const EdgeInsets.only(bottom: 8.0),
                  ),
                  Text(
                    containerTexts[i],
                    style: TextStyle(color: widget.textColor),
                  ),
                ],
              ),
            ),
      ],
    );
  }
}

final containerTexts = [
  'Vigor',
  'Mente',
  'Energia',
  'Fuerza',
  'Destreza',
  'Inteligencia',
  'Fe',
  'Arcano',
  '',
];


class WeaponsPage extends StatelessWidget {
  static const routeName = '/weapons';

  const WeaponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/eldenring-phone-wallpaper-thypix-072.jpg'),
        fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor:const Color.fromARGB(0, 0, 0, 0),
        appBar: AppBar(
          title: const Text('Armas Recomendadas para cada clase'),
          foregroundColor: const Color.fromRGBO(253, 245, 4, 1),
          backgroundColor: const Color.fromARGB(255, 52, 63, 75),
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(0, 158, 158, 158), // Color de fondo del encabezado
                ),
                child: Column(
                  children: <Widget>[
                    const Text(
                      'puedes deslisar a la derecha para ver mas armas y equipamiento armas recomendadas de Build de fuerza supremas', // Subtítulo
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 250.0,
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal, // ListView horizontal
                        children: <Widget>[
                          const SizedBox(width: 20.0), // Espacio en blanco inicial
                          Image.asset('assets/starscourge-greatsword-weapon-elden-ring-wiki-guide.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/bullgate-set-elden-ring-wiki-guide.png', width: 120.0, height: 120.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/talisman-fuerza.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 10.0), // Espacio entre imágenes
                          // Agrega más imágenes según sea necesario
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0), // Espacio entre las filas de imágenes
    
                    // A continuación, 6 contenedores más con filas de imágenes similares
                          const Text(
                      'Build de versatilidad: cuerpo a cuerpo + distancia', // Subtítulo
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 250.0,
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal, // ListView horizontal
                        children: <Widget>[
                          const SizedBox(width: 20.0), // Espacio en blanco inicial
                          Image.asset('assets/horn_bow_weapon_elden_ring_wiki_guide_200px.png', width: 100.0, height: 100.0), // Ejemplo de una segunda fila de imágenes
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/cuerpo-a-cuerpo-distancia.png', width: 100.0, height: 100.0), // Ejemplo de una segunda fila de imágenes
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/exile-set-elden-ring-wiki-guide.png', width: 100.0, height: 100.0), // Ejemplo de una segunda fila de imágenes
                          const SizedBox(width: 10.0), // Espacio entre imágenes
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
    
                    const Text(
                      'Build de cuerpo a cuerpo + magia', // Subtítulo
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 250.0,
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal, // ListView horizontal
                        children: <Widget>[
                          const SizedBox(width: 20.0), // Espacio en blanco inicial
                          Image.asset('assets/Build de cuerpo a cuerpo + magia1.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/velo-lunar.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
    
                    const Text(
                      'Build de magia equilibrada sirve cualquier armadura ligera', // Subtítulo
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 250.0,
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal, // ListView horizontal
                        children: <Widget>[
                          const SizedBox(width: 20.0), // Espacio en blanco inicial
                          Image.asset('assets/Build de magia equilibrada1.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/Build de magia equilibrada2.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Build de magia suprema', // Subtítulo
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 250.0,
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal, // ListView horizontal
                        children: <Widget>[
                          const SizedBox(width: 20.0), // Espacio en blanco inicial
                          Image.asset('assets/baston-de-piedra-refulgente-de-lusat.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/Set de bruja de las nieves.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/cometa-azur.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 10.0), // Espacio entre imágenes
                          // Agrega más imágenes según sea necesario
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
    
                    const Text(
                      'build para la clase Guerrero', // Subtítulo
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 250.0,
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal, // ListView horizontal
                        children: <Widget>[
                          const SizedBox(width: 20.0), // Espacio en blanco inicial
                          Image.asset('assets/espada-de-escamas-de-dragon-de-magma.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/set de cabra.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/espadon-de-hoja-injertada.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 10.0), // Espacio entre imágenes
                          // Agrega más imágenes según sea necesario
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
    
                    const Text(
                      'build para la clase Héroe', // Subtítulo
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 250.0,
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal, // ListView horizontal
                        children: <Widget>[
                          const SizedBox(width: 20.0), // Espacio en blanco inicial
                          Image.asset('assets/espadon-de-hoja-injertada.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/set del crisol.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/ceniza-de-guerra-grito-de-guerra.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 10.0), // Espacio entre imágenes
                          // Agrega más imágenes según sea necesario
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                                      const Text(
                      'build para la clase Confesor', // Subtítulo
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 250.0,
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal, // ListView horizontal
                        children: <Widget>[
                          const SizedBox(width: 20.0), // Espacio en blanco inicial
                          Image.asset('assets/guadana-aureolada.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/aristocrat_set.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/lanza-fulgurante.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 10.0), // Espacio entre imágenes
                          // Agrega más imágenes según sea necesario
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class CharactersPage extends StatelessWidget {
  static const routeName = '/characters';

  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/fondo.jpeg'),
        fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor:const Color.fromARGB(0, 0, 0, 0),
        appBar: AppBar(
          title: const Text('Bild de personages para NG+'),
          foregroundColor: const Color.fromRGBO(253, 245, 4, 1),
          backgroundColor: const Color.fromARGB(255, 52, 63, 75),
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(0, 158, 158, 158), // Color de fondo del encabezado
                ),
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Aca te mostramos las posibles bild que puedes hacer inspirado en personajes de juego y animes.                                                                           Virgil DMC5', // Subtítulo
                      style: TextStyle (fontSize: 18, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 250.0,
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal, // ListView horizontal
                        children: <Widget>[
                          const SizedBox(width: 20.0), // Espacio en blanco inicial
                          Image.asset('assets/virgil.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/velo-lunar.png', width: 120.0, height: 120.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/espada-vigil.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 10.0), // Espacio entre imágenes
                          // Agrega más imágenes según sea necesario
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0), // Espacio entre las filas de imágenes
    
                    // A continuación, 6 contenedores más con filas de imágenes similares
                          const Text(
                      'Ichigo chikai', // Subtítulo
                      style: TextStyle (fontSize: 18, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 250.0,
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal, // ListView horizontal
                        children: <Widget>[
                          const SizedBox(width: 20.0), // Espacio en blanco inicial
                          Image.asset('assets/ichigo-kurosaki-1.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio en blanco inicial
                          Image.asset('assets/chikai.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio en blanco inicial
                          Image.asset('assets/cenisa.png', width: 100.0, height: 100.0), // Ejemplo de una segunda fila de imágenes
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/fia.png', width: 100.0, height: 100.0), // Ejemplo de una segunda fila de imágenes
                          const SizedBox(width: 10.0), // Espacio entre imágenes
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
    
                    const Text(
                      'Escanor', // Subtítulo
                      style: TextStyle (fontSize: 18, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 250.0,
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal, // ListView horizontal
                        children: <Widget>[
                          Image.asset('assets/escanor.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          const SizedBox(width: 20.0), // Espacio en blanco inicial
                          Image.asset('assets/alabarda-dorada.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/sello-del-gigante.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/armadura-de-centinela-agreste.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/llama.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/llama-dame-fuerza.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
    
                    const Text(
                      'kratos Nordico', // Subtítulo
                      style: TextStyle (fontSize: 18, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 250.0,
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal, // ListView horizontal
                        children: <Widget>[
                          const SizedBox(width: 20.0), // Espacio en blanco inicial
                          Image.asset('assets/kratos nordico.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/kratos armor.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/kratos arma.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'kratos Griego', // Subtítulo
                      style: TextStyle (fontSize: 18, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 250.0,
                      height: 100.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal, // ListView horizontal
                        children: <Widget>[
                          const SizedBox(width: 20.0), // Espacio en blanco inicial
                          Image.asset('assets/kratos griego.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/hoja.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/hoja.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          Image.asset('assets/kratos armor.png', width: 100.0, height: 100.0),
                          const SizedBox(width: 20.0), // Espacio entre imágenes
                          // Agrega más imágenes según sea necesario
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
