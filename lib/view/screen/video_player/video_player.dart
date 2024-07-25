import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class VideoApp extends StatefulWidget {
  final String urlVideo;
  final String videoId;
  final String name;
  final String coursesId;
  VideoApp({super.key, required this.urlVideo, required this.videoId, required this.coursesId, required this.name});

  @override
  _VideoAppState createState() => _VideoAppState(urlVideo, videoId, coursesId ,name);
}

class _VideoAppState extends State<VideoApp> {
  final String urlVideo;
  final String videoId;
  final String coursesId;
  final String name;
  VideoPlayerController? _controller;
  bool _isDownloading = false;
  String _downloadProgress = "";
  String? _localVideoPath;

  _VideoAppState(this.urlVideo, this.videoId, this.coursesId, this.name);

  @override
  void initState()  {
    _initializeVideoPlayer();
    super.initState();
  }

  Future<void> _initializeVideoPlayer() async {
    final appDir = await getApplicationDocumentsDirectory();
    final filePath = '${appDir.path}/$name';
    final file = File(filePath);
    if (await file.exists())  {
      _localVideoPath = filePath;
      print('file-------------------------------------------------');
      _controller = await VideoPlayerController.file(file);
      print(' After file-------------------------------------------------');

    } else {
      _controller = VideoPlayerController.networkUrl(Uri.parse(urlVideo));
    }
    _controller!.initialize().then((_) {
      setState(() {});
    });
  }

  Future<void> _downloadVideo() async {
    setState(() {
      _isDownloading = true;
    });

    try {
      final appDir = await getApplicationDocumentsDirectory();
      final filePath = '${appDir.path}/$name';
      final dio = Dio();

      await dio.download(
        urlVideo,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              _downloadProgress = (received / total * 100).toStringAsFixed(0) + "%";
            });
          }
        },
      );

      setState(() {
        _isDownloading = false;
        _downloadProgress = "Download completed!";
        _localVideoPath = filePath;
        _controller = VideoPlayerController.file(File(filePath));
        _controller?.initialize().then((_) {
          setState(() {});
        });
      });
    } catch (e) {
      setState(() {
        _isDownloading = false;
        _downloadProgress = "Download failed!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<DocumentSnapshot<Map<String, dynamic>>> getData =
    FirebaseFirestore.instance.collection("courses").doc(coursesId).collection("video").doc(videoId).get();

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: _controller==null ?Center(child: CircularProgressIndicator()): Column(
        children: [
          Expanded(
            child: Center(
              child: _controller!.value.isInitialized
                  ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer( _controller!  ),
                    Positioned(
                      bottom: -10,
                      left: 0,
                      right: 0,
                      child: Slider(
                        value: _controller!.value.position.inSeconds.toDouble(),
                        min: 0,
                        max: _controller!.value.duration.inSeconds.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            _controller!.seekTo(Duration(seconds: value.toInt()));
                          });
                        },
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      right: 25,
                      child: Text(
                        '${_controller!.value.position.inHours}:${_controller!.value.position.inMinutes.remainder(60)}:${_controller!.value.position.inSeconds.remainder(60)}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )
                  : Container(),
            ),
          ),
          if (_isDownloading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Downloading: $_downloadProgress"),
            ),
          ElevatedButton(
            onPressed: _isDownloading ? null : _downloadVideo,
            child: Text("Download Video"),
          ),
        ],
      ),
      floatingActionButton: _controller==null ?SizedBox(): FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();
          });
        },
        child: Icon(_controller!.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}
