import 'package:assistant/views/speech_to_text_view.dart';
import 'package:assistant/views/text_to_speech_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("TalkType"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SpeechtoText()));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
            ), child: Text("Speech to Text", style:  TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height / 40),),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const TexttoSpeech()));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
            ), child: Text("Text to Speech ", style:  TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height / 40),),
            ),
        
          ],
        ),
      ),
    );
  }
}