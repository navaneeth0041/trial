import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechtoText extends StatefulWidget {
  const SpeechtoText({super.key});

  @override
  State<SpeechtoText> createState() => _SpeechtoTextState();
}

class _SpeechtoTextState extends State<SpeechtoText> {

  final SpeechToText _speechToText = SpeechToText();

  bool _speechEnabled = false;

  String _wordsSpoken = "";

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async{
    _speechEnabled= await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult:_onSpeechResult );
    setState(() {

    });
  }
    void _stop() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = "${result.recognizedWords}";
    });

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow,
      title: const Text("Don't mind it's just a trial run"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child:Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(_speechToText.isListening?"listening you...":_speechEnabled?"click the mic or die...":"something went wrong...skill issue", style: const TextStyle(fontSize: 20),
                ),
              ) ,
            ),
            Expanded(child: Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(_wordsSpoken,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
                ),
              ),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _speechToText.isListening?_stop:_startListening,
      tooltip: "Listen",
      child: Icon(
        _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
      ),
      ),
    );
  }
}