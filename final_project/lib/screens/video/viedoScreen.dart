import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:final_project/screens/video/videoBrain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late int _remoteUid = 0;
  late RtcEngine _engine;
  bool _isMicMuted = false;
  bool _isCameraOff = false;
  bool _isRemoteCameraOff = false;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  @override
  void dispose() {
    _engine.leaveChannel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _renderRemoteVideo(),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150.0),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: _renderLocalPreview(),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      _toggleCamera();
                    },
                    icon: Icon(
                      _isCameraOff ? Icons.videocam_off : Icons.videocam,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      icon: Icon(
                        Icons.call_end,
                        color: Colors.redAccent,
                        size: size.height * 50 / 932,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _toggleMic();
                    },
                    icon: Icon(
                      _isMicMuted ? Icons.mic_off : Icons.mic,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> initAgora() async {
    await [Permission.microphone, Permission.camera].request();
    _engine = await RtcEngine.create(AgoraManager.appld);
    await _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user uid:$uid joined successfully");
        },
        userJoined: (int uid, int elapsed) {
          print("remote user uid:$uid joined successfully");
          setState(() {
            _remoteUid = uid;
            _isRemoteCameraOff = false; // Reset when user joins
          });
        },
        userOffline: (uid, UserOfflineReason reason) {
          print("remote user uid:$uid left");
          setState(() {
            _remoteUid = 0;
          });
          Navigator.of(context).pop(true);
        },
        userMuteVideo: (uid, bool muted) {
          setState(() {
            if (uid == _remoteUid) {
              _isRemoteCameraOff = muted;
            }
          });
        },
      ),
    );
    await _engine.joinChannel(
        AgoraManager.token, AgoraManager.channelName, null, 0);
  }

  Widget _renderLocalPreview() {
    if (_isCameraOff) {
      return Image.asset(
        'assets/images/default-avatar.jpg',
        fit: BoxFit.cover,
      );
    } else {
      return const RtcLocalView.SurfaceView();
    }
  }

  Widget _renderRemoteVideo() {
    if (_remoteUid != 0) {
      if (_isRemoteCameraOff) {
        return Image.asset(
          'assets/images/default-avatar.jpg',
          fit: BoxFit.cover,
        );
      } else {
        return RtcRemoteView.SurfaceView(
          channelId: AgoraManager.channelName,
          uid: _remoteUid,
        );
      }
    } else {
      return Container(
        width: double.infinity,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
            const Text(
              "Calling",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    }
  }

  void _toggleMic() {
    _engine.muteLocalAudioStream(!_isMicMuted);
    setState(() {
      _isMicMuted = !_isMicMuted;
    });
  }

  void _toggleCamera() {
    if (_isCameraOff) {
      _engine.enableLocalVideo(true);
      _engine.muteLocalVideoStream(false);
    } else {
      _engine.enableLocalVideo(false);
      _engine.muteLocalVideoStream(true);
    }
    setState(() {
      _isCameraOff = !_isCameraOff;
    });
  }
}
