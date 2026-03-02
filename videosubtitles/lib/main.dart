import 'dart:convert';
import 'dart:io';

import 'package:appwrite/appwrite.dart';
//import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
//import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/log.dart';
import 'package:ffmpeg_kit_flutter_new/session.dart';
import 'package:ffmpeg_kit_flutter_new/statistics.dart';

/*
import 'package:ffmpeg_kit_flutter_new_gpl/abstract_session.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/arch_detect.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/chapter.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/ffmpeg_kit_config.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/ffmpeg_session.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/ffmpeg_session_complete_callback.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/ffprobe_session.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/ffprobe_session_complete_callback.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/level.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/log.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/log_callback.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/log_redirection_strategy.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/media_information.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/media_information_json_parser.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/media_information_session.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/media_information_session_complete_callback.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/packages.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/return_code.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/session.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/session_state.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/signal.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/statistics.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/statistics_callback.dart';
import 'package:ffmpeg_kit_flutter_new_gpl/stream_information.dart';
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Subtitler',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: const SubtitleGeneratorPage(),
    );
  }
}

class SubtitleGeneratorPage extends StatefulWidget {
  const SubtitleGeneratorPage({super.key});

  @override
  State<SubtitleGeneratorPage> createState() => _SubtitleGeneratorPageState();
}

class _SubtitleGeneratorPageState extends State<SubtitleGeneratorPage> {
  final _appwriteEndpointCtrl = TextEditingController(
    text: 'https://fra.cloud.appwrite.io/v1',
  );
  final _appwriteProjectCtrl = TextEditingController(
    text: '696ddda6001b28f2352e',
  );
  final _appwriteBucketCtrl = TextEditingController(
    text: '69a00b070018aac953fa',
  );
  final _appwriteFileIdCtrl = TextEditingController(
    text: 'video698e04cf0004b5e7e7df_36.mp4',
  );


  bool _isProcessing = false;
  String _statusMessage = 'Idle';

  void _setStatus(String status) {
    setState(() {
      _statusMessage = status;
    });
    debugPrint(status);
  }

  Future<void> _processVideo() async {
    if (_appwriteEndpointCtrl.text.isEmpty ||
        _appwriteProjectCtrl.text.isEmpty ||
        _appwriteBucketCtrl.text.isEmpty ||
        _appwriteFileIdCtrl.text.isEmpty ||
        _googleApiKeyCtrl.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    setState(() {
      _isProcessing = true;
    });

    try {
      final endpoint = _appwriteEndpointCtrl.text.trim();
      final projectId = _appwriteProjectCtrl.text.trim();
      final bucketId = _appwriteBucketCtrl.text.trim();
      final fileId = _appwriteFileIdCtrl.text.trim();
      final googleApiKey = _googleApiKeyCtrl.text.trim();

      // 1. Initialize Appwrite
      _setStatus('Initializing Appwrite...');
      final client = Client().setEndpoint(endpoint).setProject(projectId);
      final storage = Storage(client);

      // 2. Download video from Appwrite
      _setStatus('Downloading video...');
      final tempDir = await getTemporaryDirectory();
      final videoPath = '${tempDir.path}/input_$fileId.mp4';
      final videoFile = File(videoPath);

      final res = await storage.getFileDownload(
        bucketId: bucketId,
        fileId: fileId,
      );
      await videoFile.writeAsBytes(res);
      _setStatus('Video downloaded: $videoPath');

      // 3. Extract Audio using FFmpeg
      _setStatus('Extracting audio...');
      final audioPath = '${tempDir.path}/audio_$fileId.wav';
      // -y to overwrite, -vn no video, -acodec pcm_s16le is standard 16-bit WAV, -ar 16000 is 16kHz, -ac 1 is mono
      final extractCommand =
          '-y -i "$videoPath" -vn -acodec pcm_s16le -ar 16000 -ac 1 "$audioPath"';
      final session = await FFmpegKit.execute(extractCommand);
      final returnCode = await session.getReturnCode();
      // if (!ReturnCode.isSuccess(returnCode)) {
      //   throw Exception('Failed to extract audio');
      // }

      // 4. Send audio to Google Speech-to-Text
      _setStatus('Transcribing audio...');
      final audioBytes = await File(audioPath).readAsBytes();
      final audioBase64 = base64Encode(audioBytes);

      final sttUrl = Uri.parse(
        'https://speech.googleapis.com/v1/speech:recognize?key=$googleApiKey',
      );
      final sttResponse = await http.post(
        sttUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'config': {
            'encoding': 'LINEAR16',
            'sampleRateHertz': 16000,
            'languageCode': 'en-US',
            'enableWordTimeOffsets': true,
          },
          'audio': {'content': audioBase64},
        }),
      );

      if (sttResponse.statusCode != 200) {
        throw Exception('Speech API error: ${sttResponse.body}');
      }

      final sttData = jsonDecode(sttResponse.body);

      // 5. Generate SRT from words
      _setStatus('Generating subtitles...');
      final srtPath = '${tempDir.path}/subs_$fileId.srt';
      final srtContent = _generateSrtFromGoogleResponse(sttData);
      print('(VS1)${sttData}....${srtContent}');
      await File(srtPath).writeAsString(srtContent);

      // 6. Embed subtitles into new video
      _setStatus('Embedding subtitles...');
      final outVideoPath = '${tempDir.path}/output_$fileId.mp4';
      final embedCommand =
        //  '-y -i "$videoPath" -i "$srtPath" -c copy -c:s mov_text "$outVideoPath"';
      '-y -i "$videoPath" -vf subtitles="$srtPath" "$outVideoPath"';

      final embedSession = await FFmpegKit.execute(embedCommand);
      final embedReturnCode = await embedSession.getReturnCode();
      print('(VS2)${embedReturnCode!.getValue()}....$srtPath,,,,');

      // if (!ReturnCode.isSuccess(embedReturnCode)) {
      //   throw Exception('Failed to embed subtitles');
      // }

      // 7. Upload the new video to Appwrite
      _setStatus('Uploading new video...');
      final outVideoFile = File(outVideoPath);
      final uploadedFile = await storage.createFile(
        bucketId: bucketId,
        fileId: ID.unique(),
        file: InputFile.fromPath(
          path: outVideoFile.path,
          filename: 'subtitled_$fileId.mp4',
        ),
      );
      print('(VS3)${outVideoFile.path}');
      final sttFile = await storage.createFile(
        bucketId: bucketId,
        fileId: ID.unique(),
        file: InputFile.fromPath(
          path: srtPath,
          filename: 'srt_$fileId.srt',
        ),
      );
      _setStatus(
        'Done! Subtitled video uploaded (File ID: ${uploadedFile.$id})',
      );

      // Cleanup
      try {
        await videoFile.delete();
        await File(audioPath).delete();
        await File(srtPath).delete();
        await outVideoFile.delete();
      } catch (_) {}
    } catch (e) {
      _setStatus('Error: $e');
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  String _generateSrtFromGoogleResponse(Map<String, dynamic> data) {
    if (!data.containsKey('results')) return '';
    final results = data['results'] as List;
    int index = 1;
    final buffer = StringBuffer();

    for (final result in results) {
      final alternatives = result['alternatives'] as List?;
      if (alternatives == null || alternatives.isEmpty) continue;
      final alternative = alternatives.first;
      final words = alternative['words'] as List?;
      if (words == null || words.isEmpty) continue;

      // Group words into short chunks (e.g., 5 words per subtitle)
      final chunkSize = 5;
      for (int i = 0; i < words.length; i += chunkSize) {
        final chunk = words.sublist(
          i,
          i + chunkSize > words.length ? words.length : i + chunkSize,
        );

        final startWord = chunk.first;
        final endWord = chunk.last;

        final startSeconds = _parseGoogletime(startWord['startTime'] ?? '0s');
        final endSeconds = _parseGoogletime(endWord['endTime'] ?? '0s');
        final text = chunk.map((w) => w['word']).join(' ');

        buffer.writeln(index++);
        buffer.writeln(
          '${_formatSrtTime(startSeconds)} --> ${_formatSrtTime(endSeconds)}',
        );
        buffer.writeln(text);
        buffer.writeln();
      }
    }
    return buffer.toString();
  }

  double _parseGoogletime(String timeStr) {
    return double.tryParse(timeStr.replaceAll('s', '')) ?? 0.0;
  }

  String _formatSrtTime(double totalSeconds) {
    final int hours = totalSeconds ~/ 3600;
    final int minutes = (totalSeconds % 3600) ~/ 60;
    final int seconds = (totalSeconds % 60).toInt();
    final int ms = ((totalSeconds - totalSeconds.toInt()) * 1000).toInt();

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')},${ms.toString().padLeft(3, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auto Subtitles Maker')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.movie_creation,
              size: 64,
              color: Colors.deepPurpleAccent,
            ),
            const SizedBox(height: 24),
            Text(
              'Add Subtitles to Appwrite Video',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _appwriteEndpointCtrl,
              decoration: const InputDecoration(
                labelText: 'Appwrite Endpoint',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _appwriteProjectCtrl,
              decoration: const InputDecoration(
                labelText: 'Appwrite Project ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _appwriteBucketCtrl,
              decoration: const InputDecoration(
                labelText: 'Appwrite Bucket ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _appwriteFileIdCtrl,
              decoration: const InputDecoration(
                labelText: 'Appwrite Video File ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _googleApiKeyCtrl,
              decoration: const InputDecoration(
                labelText: 'Google Cloud API Key',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _isProcessing ? null : _processVideo,
              icon: _isProcessing
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.cloud_upload),
              label: Text(_isProcessing ? 'Processing...' : 'Process Video'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white24),
              ),
              child: Text(
                _statusMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _statusMessage.startsWith('Error')
                      ? Colors.redAccent
                      : Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _appwriteEndpointCtrl.dispose();
    _appwriteProjectCtrl.dispose();
    _appwriteBucketCtrl.dispose();
    _appwriteFileIdCtrl.dispose();
    _googleApiKeyCtrl.dispose();
    super.dispose();
  }
}
