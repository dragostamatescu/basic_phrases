import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const BasicPhrasesApp());
}

class BasicPhrasesApp extends StatelessWidget {
  const BasicPhrasesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    ); // MaterialApp
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> phrases = <String>[
    'Salut',
    'Hola',
    'Mă numesc',
    'Me llamo',
    'Ce faci?',
    'Que haces',
    'Unde e biblioteca',
    'Donde está la biblioteca',
    'La revedere',
    'Adiós'
  ];

  final List<String> audioFiles = <String>[
    'salut',
    'hola',
    'ma_numesc',
    'me_llamo',
    'ce_faci',
    'que_haces',
    'unde_e_biblioteca',
    'donde_esta_la_biblioteca',
    'la_revedere',
    'adios'
  ];
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Basic Phrases')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                await player.setAsset('assets/audio/${audioFiles[index]}.wav');
                player.play();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: <Color>[
                      Colors.blue,
                      Colors.lightBlueAccent,
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    phrases[index],
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
