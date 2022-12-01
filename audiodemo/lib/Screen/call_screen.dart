
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_rtm/agora_rtm.dart';
import 'package:audiodemo/Widget/user_view.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';



class callScreen extends StatefulWidget {

   final String channelName;
   final String userName;

  const callScreen({Key? key, required this.channelName, required this.userName}) : super(key: key);

  @override
  State<callScreen> createState() => _callScreenState();
}

class _callScreenState extends State<callScreen> {
  bool _isInChannel = false;
  final _broadcaster = <String>[];
  final _audience = <String>[];
  final Map<int,String> _allUsers = {};
  late AgoraRtmClient _client;
  late AgoraRtmChannel _channel;
  late  RtcEngine _engine;
  late int localUid;
  late String userRole;




  Future<void> initRTC() async {

     _engine = await createAgoraRtcEngine();
    await _engine.initialize(RtcEngineContext(appId: appid));
    await _engine.setChannelProfile(ChannelProfileType.channelProfileLiveBroadcasting);
     if(userRole == "audience"){
      await _engine.setClientRole(role: ClientRoleType.clientRoleAudience);
     }
     else{
      await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
     }
     await _engine.enableAudio();
     await _engine.joinChannel(null, channelId: widget.channelName, uid: uid,null);



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
