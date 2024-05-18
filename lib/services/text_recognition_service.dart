import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class TextRecognitionService {
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  Future<String> recognizeText(InputImage inputImage) async {
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    return recognizedText.text;
  }
}