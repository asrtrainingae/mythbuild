import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myth/features/patients/presentation/widgets.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/assets.dart';
import 'package:myth/utils/constants/sizes.dart';
import 'package:myth/utils/text_styles.dart';
import 'package:myth/utils/text_styles2.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:myth/widgets/buttons.dart';
class AddPatientPage extends ConsumerStatefulWidget {
  const AddPatientPage({super.key});

  @override
  ConsumerState<AddPatientPage> createState() => _AddPatientPageState();
} 
class _AddPatientPageState extends ConsumerState<AddPatientPage> {
  late double screenWidth;
  int selectedTab = 1;
  List<Goal> gloals = [
    Goal(selected: false, title:"goal1"),
    Goal(selected: false, title:"goal2"),
    Goal(selected: false, title:"goal3"),
  ];

  @override
  Widget build(BuildContext context) {
     
  gloals = [
    Goal(selected: false, title:"${S.of(context).goal_1}"),
    Goal(selected: false, title:"${S.of(context).goal_2}"),
    Goal(selected: false, title:"${S.of(context).goal_3}"),
  ];
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true ,
      appBar:AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_circle_left_outlined , color:Colors.white) ,
        onPressed: (){Navigator.of(context).pop();}),
        title:Text(S.of(context).new_case, style: black_16_bold), 
      centerTitle: true,),
      body: profile(context: context));
  }

  Widget buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50)
            ),
            child: Icon(
              size : 20 ,
              icon, color: const Color.fromARGB(255, 0, 0, 0) ,)),
          SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Widget profile({required BuildContext context}){
    return SingleChildScrollView(
                  child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top:100),
                          color:AppColors.primary,
                          child: Stack(
                            children: [
                              Container(
                                margin:EdgeInsets.only(top:50) ,
                                padding:EdgeInsets.only(top:50),
                                decoration:BoxDecoration(
                                color:Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  )
                                ),
                                width:double.infinity,
                                child:Column(children: [
                                  Text(
                                                "Daniel Williams",
                                                style: TStyles.secondary18Bold
                                                ),
                                                const SizedBox(
                                              height: TSizes.spaceBtwItems / 2,
                                            ),
                                            Center(
                                              child: Text(
                                                  S.of(context).case_name,
                                                  style:TextStyle(color:AppColors.secondary,  fontSize: 16)),
                                            ),
                                ],)
                              ),
                              Align(

                                child: Container(
                                  width: 100,height:100,
                                  decoration: BoxDecoration(
                                    border:Border.all(color:Colors.white , width: 2 ),
                                    image  :DecorationImage(image: AssetImage(Assets.userProfileImage1) ),
                                    borderRadius: BorderRadius.circular(100)
                                  ),
                                
                                ),
                              ),
                              

                            ],
                          ),
                        ),_buildCardDetails(),
                                    SizedBox(height: 16),
                                    _buildAddDiagnosisDivider(),
                                    SizedBox(height: 16),
                                    _buildAddDiagnosis(),
                                      const SizedBox(
                                          height: TSizes.spaceBtwItems,
                                        ),
                                        const SizedBox(
                                          height: TSizes.spaceBtwItems,
                                        ),
                                _buildSegmented(),
                                _buildShortGoalRange()
                              
                      ],
                    ),
                 
    );
    
  }

Widget _buildAddDiagnosisDivider(){
  return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Text(
                'Diagnosis',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary ,//Colors.white,
                ),
              ),
            );
}

Widget textWithWrap(text ){
  return Text(text ,  maxLines: 1 , softWrap: true , overflow:TextOverflow.ellipsis);
}
Widget _buildCardDetails(){
  return Container(
    // color:Colors.red ,
    width:double.infinity,
    child: Card(
      color:Color.fromARGB(255, 224, 224, 224).withOpacity(.95),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${S.of(context).name}: Daniel William',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${S.of(context).case_number}: 845683521',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${S.of(context).phone_number}: +971*********',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${S.of(context).centre_name}e: Al-Ahmad care center',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
  );
}
Widget _buildAddDiagnosis(){
  return Container(
    width:double.infinity,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent[100],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child:TextField(
                
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText:"${S.of(context).add_your_diagnosis}"
                ),
                maxLines:5,
                minLines: 3,
              )
            );
}
Widget _buildSegmented(){
  return CustomSlidingSegmentedControl<int>( 
  initialValue: 1,
  fixedWidth:screenWidth*.9/3 ,
  children: {
    1: textWithWrap(S.of(context).short_goals_range),
    2: textWithWrap(S.of(context).long_goals_range),
    3: textWithWrap(S.of(context).treatment_plan),
  },
  decoration: BoxDecoration(
    color: AppColors.grey,
    // borderRadius: BorderRadius.circular(8),
  ),
  thumbDecoration: BoxDecoration(
    color: AppColors.primary,
    // borderRadius: BorderRadius.circular(0),
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
  duration: Duration(milliseconds: 300),
  curve: Curves.easeInToLinear,
  onValueChanged: (v) {
    setState(() {
      selectedTab = v;
    });
  },
);
}

Widget _buildShortGoalRange(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).list_of_short_goals , style:TStyles.secondary14Bold),
        SizedBox(height: 8.0),
          Container(
            // padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color:  AppColors.primary.withOpacity(.3),
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: gloals.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (cntx , index){
                final goal = gloals[index];
                return  GestureDetector(
                onTap: () {
                  print("PRESS");
                  setState(() {
                    goal.selected = !goal.selected;
                  });
                },
                child: ListTile(
                  leading: goal.selected
                      ? Icon(Icons.check_box , color: primary_color,)
                      : Icon(Icons.check_box_outline_blank),
                  title: Text("${goal.title}"),
                ),
              );
              })
          
          ),
          SizedBox(height:10),
          textFieldBig(hint:S.of(context).add_other),
          SizedBox(height:10),
         if(selectedTab==1)  Text(S.of(context).video , style:TStyles.secondary14Bold),
        SizedBox(height: 8.0),
          if(selectedTab==1)Container(
            width: double.infinity,
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(10),
              color:AppColors.primary
            ),
            height:120,
            child: Center(
              child:Icon(Icons.play_arrow  , color:Colors.white)
            )
          ),
        Center(child: mainButtonPrimary(text:S.of(context).save_changes))


      ],
    ),
  );
}

}

class Goal {
  String title;
  bool selected;
  Goal({required this.title , required this.selected});
}

