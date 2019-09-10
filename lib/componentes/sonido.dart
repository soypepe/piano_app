import 'package:audioplayers/audio_cache.dart';

void pianoSonido(int sonido, String tono) {
  final player = AudioCache();
  player.play('note$sonido$tono.wav');
}
