import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(
  MaterialApp(
    home: Home(),
  )
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "audios/");
  bool primeiraExecucao = true ;
  double volume = 0.5;

  _executar() async{
    audioPlayer.setVolume(volume);
    if(primeiraExecucao){
      audioPlayer = await audioCache.play("musica.mp3");
      primeiraExecucao =false;
    }else{
      audioPlayer.resume();
    }
    
  }
  _pausar() async{
    int resultado = await audioPlayer.pause();
  }
  _parar() async{
    int resultado = await audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    // _executar();
    return Scaffold(
      appBar: AppBar(
        title: Text("Executando sons"),
      ),
      body: Column(
        children: <Widget>[
          Slider(
            value: volume, 
            min: 0,
            max: 1,
            onChanged: (novoVolume){
              setState(() {
                volume = novoVolume;
              });
              audioPlayer.setVolume(novoVolume);
            }
          ),
          Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Padding(
                 padding: EdgeInsets.all(8),
                 child: GestureDetector(
                   child: Image.asset("assets/images/executar.png"),
                   onTap: (){
                     _executar();
                   },
                 ),
                 ),
                Padding(
                 padding: EdgeInsets.all(8),
                 child: GestureDetector(
                   child: Image.asset("assets/images/pausar.png"),
                   onTap: (){
                     _pausar();
                   },
                 ),
                 ),
                Padding(
                 padding: EdgeInsets.all(8),
                 child: GestureDetector(
                   child: Image.asset("assets/images/parar.png"),
                   onTap: (){
                     _parar();
                   },
                 ),
                 ),
             ],
          )
        ],
      ),
    );
  }
}