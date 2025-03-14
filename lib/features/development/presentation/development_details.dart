import 'dart:async';
import 'dart:math';
import 'package:animations/animations.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myth/features/development/cubit/development_cubit.dart';
import 'package:myth/features/development/cubit/development_cubit.dart';
import 'package:myth/generated/l10n.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/assets.dart';
import 'package:myth/utils/text_styles2.dart';
import 'package:myth/widgets/app_bars.dart';
import 'package:myth/widgets/error_and_loading.dart';

import 'development_details_more.dart';

class DevelopmentDetailsPage extends StatefulWidget {
  @override
  State<DevelopmentDetailsPage> createState() => _DevelopmentDetailsPageState();
}

class _DevelopmentDetailsPageState extends State<DevelopmentDetailsPage> {
  DateTime startTime = DateTime.now();
   Duration _elapsedTime = Duration(minutes: 30);
   late Timer _timer;
   DateTime _endTime = DateTime(2024, 12, 11, 7, 30); // Example: 7:30 AM

  Random random = new Random();
  var progress = 30.0;
  String current_state = "Speech Treatment";
  int currentSegment = 1;
  @override
   void _startTimer(DateTime time) {
    startTime=time;
    _endTime= time.add(Duration(minutes:30));
    if (startTime.isBefore(_endTime)) {
      
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        final now = DateTime.now();
        if (now.isAfter(_endTime)) {
          print("STOP::::::::::::::");
          timer.cancel(); // Stop when end time is reached
        } else {
          print("PLAY::::::::::::::");
          setState(() {
            _elapsedTime = now.difference(startTime);
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  Widget build(BuildContext context) {
  
    final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: myAppBar(
          title: "${S.of(context).development_details}", context: context),
      body: BlocBuilder<DevelopmentCubit, DevelopmentState>(
        builder: (context, state) {
          return state.when(initial: ()=>Loading(), loading: ()=>Loading() ,
          success: (data){
            _startTimer(data[0].startDate?? DateTime.now());
            final minutes = _elapsedTime.inMinutes;
            final seconds = _elapsedTime.inSeconds % 60;
          return Column(
            children: [
              Text("$startTime"),  
              Text("$_endTime"),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/background_image/gradiant.png",
                      ),
                      fit: BoxFit.fill),
                ),
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 90),
                      Container(
                        width: double.infinity,
                        child: CustomSlidingSegmentedControl<int>(
                          fixedWidth:
                              (MediaQuery.of(context).size.width / 3) * .8,
                          initialValue: 1,
                          height: 60,
                          children: {
                            1: Text("${S.of(context).speech_treatment}",
                                textAlign: TextAlign.center,
                                style: currentSegment != 1
                                    ? TextStyle(
                                        color: const Color.fromARGB(
                                            255, 56, 56, 56),
                                        fontWeight: FontWeight.bold)
                                    : TextStyle(
                                        color: primary_color,
                                        fontWeight: FontWeight.bold)),
                            2: Text("${S.of(context).functional_treatment}",
                                textAlign: TextAlign.center,
                                style: currentSegment != 2
                                    ? TextStyle(
                                        color: const Color.fromARGB(
                                            255, 56, 56, 56),
                                        fontWeight: FontWeight.bold)
                                    : TextStyle(
                                        color: primary_color,
                                        fontWeight: FontWeight.bold)),
                            3: Text("${S.of(context).natural_treatment}",
                                textAlign: TextAlign.center,
                                style: currentSegment != 3
                                    ? TextStyle(
                                        color: const Color.fromARGB(
                                            255, 56, 56, 56),
                                        fontWeight: FontWeight.bold)
                                    : TextStyle(
                                        color: primary_color,
                                        fontWeight: FontWeight.bold)),
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
                              return;
                              switch (v) {
                                case 1:
                                  current_state =
                                      "${S.of(context).speech_treatment}";
                                case 2:
                                  current_state =
                                      "${S.of(context).functional_treatment}";
                                case 3:
                                  current_state =
                                      "${S.of(context).natural_treatment}";
                                default:
                                  current_state =
                                      "${S.of(context).speech_treatment}";
                              }
                              progress = random.nextInt(30) + 70;
                              currentSegment = v;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 170,
                        height: 170,
                        child: DashedCircularProgressBar.aspectRatio(
                          aspectRatio: 1, // width ÷ height 
                          valueNotifier: _valueNotifier,
                          progress: _elapsedTime.inMinutes.toDouble() ,
                          maxProgress: 30,
                          corners: StrokeCap.butt,
                          foregroundColor: Colors.green,
                          backgroundColor: const Color(0xffeeeeee),
                          foregroundStrokeWidth: 5,
                          backgroundStrokeWidth: 5,
                          animation: true,
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.all(16),
                              // width: size, height:size,
                              decoration: BoxDecoration(
                                  color: const Color(0xffeeeeee),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 1,
                                        blurRadius: 4,
                                        offset: Offset(-3, -2))
                                  ],
                                  borderRadius: BorderRadius.circular(1000)),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(current_state.replaceFirst(" ", "\n"),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text( "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}",
                                        textAlign: TextAlign.center,
                                        style: black_18),
                                  ],
                                ),
                              ),
                              // color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          progressStep("${S.of(context).speech_treatment}",
                              completed: data[0].completed??false),
                          progressStep("${S.of(context).functional_treatment}",
                              completed: currentSegment >= 2),
                          progressStep("${S.of(context).natural_treatment}",
                              completed: currentSegment >= 3),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              OpenContainer(
                transitionDuration: Duration(milliseconds: 500),
                transitionType: ContainerTransitionType.fadeThrough,
                closedBuilder:
                    (BuildContext context, void Function() openContainer) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      // onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: openContainer,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).show_more_details),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  );
                },
                openBuilder: (BuildContext context,
                    void Function({Object? returnValue}) action) {
                  return DevelopmentDetailsMorePage(development: data[0],);
                },
              ),
            ],
          );}, failure: (error)=>ErrorWidget(error));
        },
      ),
    );
  }

  Widget progressStep(String title, {bool completed = false}) {
    Color? lightColor = Colors.blue[100];
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: completed ? Colors.green : lightColor,
          child: Icon(
            Icons.check,
            color: completed ? Colors.white : primary_color,
            size: 30,
          ),
        ),
        Text(
          title.replaceAll(" ", "\n"),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white, //completed ? Colors.black : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

Widget RoundedButtonAppointment(
    {required String text,
    required String time,
    required BuildContext context}) {
  double size = 200;
  return InkWell(
    onTap: () {
      // Navigator.of(context).pushNamed(Routes.appointments_by_day);
    },
    child: Container(
      width: size, height: size,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.progress_button_circle2))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text.replaceFirst(" ", "\n"),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text(time, textAlign: TextAlign.center, style: black_18),
          ],
        ),
      ),
      // color: Colors.redAccent,
    ),
  );
}
