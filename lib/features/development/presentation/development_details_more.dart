import 'package:flutter/material.dart';
import 'package:myth/app_router/app_router.dart';
import 'package:myth/features/appointments/data/models/appointment.dart';
import 'package:myth/features/development/data/model/development.dart';
import 'package:myth/generated/l10n.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/assets.dart';
import 'package:myth/utils/text_styles2.dart';
import 'package:myth/widgets/app_bars.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'dart:typed_data';

class DevelopmentDetailsMorePage extends StatefulWidget {
  Development development;
  DevelopmentDetailsMorePage({required this.development});
  @override
  State<DevelopmentDetailsMorePage> createState() => _DevelopmentDetailsMorePageState();
}

class _DevelopmentDetailsMorePageState extends State<DevelopmentDetailsMorePage> {
  late VideoPlayerController _controller;
  Uint8List? _thumbnailBytes;
  late Development development ;
  int currentSegment = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    development = widget.development;
    _generateThumbnail();
    // _controller = VideoPlayerController.networkUrl(Uri.parse(
    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
    //   ..initialize().then((_) { 
    //     print("viewo downloaded");
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   }).catchError((onError){
    //     print("viewo downloaded Error ${onError}"); 
    //   });
  }
   Future<void> _generateThumbnail() async { 
    try {
      
       Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      ].request();
      if(widget.development.video==null)return;
      final thumbnailBytes = await VideoThumbnail.thumbnailData(
        video: widget.development.video??"",
        imageFormat: ImageFormat.JPEG,
        maxWidth: 128, // Specify the width of the thumbnail, adjust as needed
        quality: 75, // Specify the quality of the thumbnail
      );

      setState(() {
        _thumbnailBytes = thumbnailBytes;
      });
      
    } catch (e) {
      print("ERROR $e");
    }
   
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: myAppBar(title: S.of(context).development_details , context:context),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width:double.infinity,
                child: CustomSlidingSegmentedControl<int>(
                  fixedWidth: (MediaQuery.of(context).size.width/3)*.8,
                  initialValue: 1,
                  height: 60,
                  children: {
                    1: Text(S.of(context).speech_treatment, textAlign: TextAlign.center, style:currentSegment!=1?TextStyle(color:Colors.grey ,fontWeight: FontWeight.bold): TextStyle(color: primary_color ,fontWeight: FontWeight.bold)),
                    2: Text(S.of(context).functional_treatment, textAlign: TextAlign.center, style:currentSegment!=2?TextStyle(color:Colors.grey ,fontWeight: FontWeight.bold): TextStyle(color: primary_color ,fontWeight: FontWeight.bold)),
                    3: Text(S.of(context).natural_treatment, textAlign: TextAlign.center, style:currentSegment!=3?TextStyle(color:Colors.grey ,fontWeight: FontWeight.bold): TextStyle(color: primary_color ,fontWeight: FontWeight.bold)),
                  },
                  decoration: BoxDecoration(
                    // color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  thumbDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      ),
                    ],
                  ),
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInToLinear,
                  onValueChanged: (v) {
                    setState(() {
                      print("size is $v");
                      currentSegment = v;
                    });
                  },
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor : Colors.grey[200],
                  // onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).show_less_details),
                    Icon(Icons.arrow_drop_up),
                  ],
                ),
              ),
              Card(
                // color: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [Color(0xFF8ca7e8).withOpacity(.55) , Color(0x0D00A7E8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                    ),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${S.of(context).therapist_name}: ${development.therapistName}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${S.of(context).centre_name}:${development.clinicName}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue[900],
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blue[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(S.of(context).session_report),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              MyDivider(), 
              buildSectionTitle('${S.of(context).treatment_plan}:'),
              buildSectionContent(
                  '${S.of(context).treatment_plan_text}'),
              MyDivider(), 
              buildSectionTitle('${S.of(context).therapeutic_goals}:'),
              buildSectionContent(
                  '${S.of(context).therapeutic_goals_text}'),
              MyDivider(), 
              buildSectionTitle('${S.of(context).completed_goals}:'),
              buildSectionContent(
                  '${S.of(context).completed_goals_text}'),
            SizedBox(height: 16),
             MyDivider(), 
            buildSectionTitle(
              '${S.of(context).video}',
            ),
            SizedBox(height: 8),
            // _controller.value.isInitialized
            //   ? AspectRatio(
            //       aspectRatio: _controller.value.aspectRatio,
            //       child: VideoPlayer(_controller),
            //     )
              
            //   :
              if(development.video!=null)
              Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: _thumbnailBytes!=null? DecorationImage(
                        image: MemoryImage(_thumbnailBytes!),
                        fit: BoxFit.cover,
                      ):null
              ),
              child: Center(
                child: InkWell(
                  onTap: (){
                    launchUrlString(development.video!);
                  //   setState(() {
                  //   _controller.value.isPlaying
                  //       ? _controller.pause()
                  //       : _controller.play();
                  // });
                  },
                  child: Icon(
                    Icons.play_circle_filled,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }

Widget MyDivider(){
  return Divider(color:const Color.fromARGB(255, 212, 212, 212));
}

 Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue[900],
        ),
      ),
    );
  }

  Widget buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.secondary,
        ),
      ),
    );
  }
Widget RoundedButtonAppointment({required String text , required String time , required BuildContext context}) {
  double size  = 200;
  return InkWell(
    onTap: (){
      Navigator.of(context).pushNamed(Routes.appointments_by_day);
    },
    child: Container(
      width: size, height:size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.progress_button_circle2))
      ),
      child: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
         children: [
           Text(text.replaceFirst(" ", "\n") , textAlign: TextAlign.center,style: TextStyle(
  fontSize: 18,
                    color: AppColors.primary,fontWeight: FontWeight.bold
                  )),
           SizedBox(height: 10,),
           Text(time , textAlign: TextAlign.center,style: black_18),
         ],
       ),
           
      ),
      // color: Colors.redAccent,
    ),
  );
}
}

