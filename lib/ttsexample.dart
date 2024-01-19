import 'package:flutter_tts/flutter_tts.dart';

class TtsExample {
  FlutterTts flutterTts = FlutterTts();

  Future<void> speakText(String textToSpeak) async {
    await flutterTts.speak(textToSpeak);
  }
}
