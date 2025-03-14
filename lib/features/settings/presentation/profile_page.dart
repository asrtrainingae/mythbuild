import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myth/app_router/app_router.dart';
import 'package:myth/data_model/auth/user.dart';
import 'package:myth/features/auth/bloc/auth_bloc.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/services/device_utils.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/assets.dart';
import 'package:myth/utils/constants/shadows.dart';
import 'package:myth/utils/constants/sizes.dart';
import 'package:myth/utils/text_styles.dart';
import 'package:myth/widgets/containers.dart';
import 'widgets.dart';
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
} 
class _ProfilePageState extends ConsumerState<ProfilePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true ,
      appBar: AppBar(
          centerTitle: true,
          title:Text(S.of(context).profile , style:black20Bold) ,
          backgroundColor: Colors.transparent, 
          leading:Navigator.of(context).canPop() ? 
          SizedBox() :  IconButton(
          onPressed: () => {
            Navigator.of(context).pushNamed(Routes.settings_page)
          }, icon: Icon(Icons.menu , color:Colors.white)),
          actions: [
            IconButton(icon: Badge(label:Text("0"),
              child: Icon(Icons.notifications , color:Colors.white)),
            onPressed: (){
              Navigator.of(context).pushNamed(Routes.notifications);},)
          ],
        ),
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
    return DefaultTabController(
      length:2 ,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if(state is UserLoggedIn) {
            User user = state.user;
            return SingleChildScrollView(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Column(
                                  children: [
      
                                    const Expanded(
                                        flex: 4,
                                        child: TProfileHeaderContainer(
                                            // child: ProfileAppbar()
                                            child:SizedBox()
                                            )
                                            ),
                                    Expanded(
                                      flex: 8,
                                      child: Column(
                                        children: <Widget>[
                                          const SizedBox(
                                            height: TSizes.spaceBtwSections +
                                                TSizes.spaceBtwItems,
                                          ),
            
                                          /// Patient Name
                                          GestureDetector(
                                            onTap: () {
            
                                            },
                                            child: Center(
                                              child: Text(
                                                user.fullName ?? "---",
                                                style: secondary2Bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: TSizes.spaceBtwItems / 2,
                                          ),
                                          Center(
                                            child: Text(
                                                "${user.diagnosis?.value??'No case yet'}",
                                                style:secondary16),
                                          ),
                                          const SizedBox(
                                            height: TSizes.spaceBtwItems,
                                          ),
            
                                          /// TabBar menu
                                           Expanded(
                                            flex: 2,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [TShadowStyle.containerShadow],
                                                gradient: AppColors.linerGradient,
                                              ),
                                              child: TabBar(
                                                dividerColor: Colors.transparent,
                                                indicator: BoxDecoration(
                                                  gradient: AppColors.tabBarLinerGradient,
                                                ),
                                                labelColor: AppColors.secondary,
                                                indicatorSize: TabBarIndicatorSize.tab,
                                                unselectedLabelStyle:
                                                    Theme.of(context).textTheme.bodyLarge,
                                                labelStyle:
                                                    Theme.of(context).textTheme.titleLarge,
                                                tabs: [
                                                  Tab(
                                                    child: Text(
                                                        "${S.of(context).personal_information}" ,maxLines: 1 , softWrap: true , 
                                                        overflow: TextOverflow.ellipsis ,style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                                  ),
                                                  Tab(
                                                    child: Text(
                                                        user.isDoctor==true?"${S.of(context).experiences}":"${S.of(context).diagnosis}" ,maxLines: 1 , softWrap: true , 
                                                        overflow: TextOverflow.ellipsis ,style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          
                                          const SizedBox(
                                            height: TSizes.spaceBtwItems,
                                          ),
            
                                          /// TabBar Body
                                          Expanded(
                                            flex: 12,
                                            child: TabBarView(
                                              physics: const NeverScrollableScrollPhysics(),
                                              children: [
                                                PersonalInformationWidget(
                                                  working_hours: "Sun 8:00 AM - 3:00 PM",
                                                  userName: "Mohamed",
                                                  email: "Mohame@gmaul.com",
                                                  phoneNum: "12121",
                                                  hospitalName: "AKAN",
                                                  careCenter: "Al-Ahmad care center",
                                                  patientNumber:123,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      TSizes.defaultSpace),
                                                  child: TRoundedContainer(
                                                    width: double.infinity,
                                                    padding: const EdgeInsets.all(TSizes.md),
                                                    shadow: TShadowStyle.whiteShadow,
                                                    gradient: AppColors.appointmentLinerGradient,
                                                    child: Text(
                                                      user.experiance??"",style: Theme.of(context)
                                                          .textTheme
                                                          .labelLarge,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
            
            
                                        ],
                                      ),
                                    ),
            
                                  ],
                                ),
            
                                /// Personal Image
                                Positioned(
                                    top: AppDimensions.of(context).height / 4,
                                    child:  Container(
                                      width:100,
                                      height:100,
                                      decoration:BoxDecoration(
                                        border:Border.all(color: Colors.white, width: 2),
                                        image:DecorationImage(image: AssetImage(Assets.userProfileImage1)),
                                        borderRadius: BorderRadius.circular(100),
                                      ))),
                              ],
                            ),
                        ),
                      );
          }else{
            return Center(child: Text("No User"),);
          }
        },
      ),
          
    );
    
  }

}

