import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myth/features/appointments/presentation/appointments.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myth/features/auth/bloc/auth_bloc.dart';
import 'package:myth/features/development/presentation/development.dart';
import 'package:myth/features/patients/presentation/cases_page.dart';
import 'package:myth/features/services/presentation/services_page.dart';
import 'package:myth/features/settings/presentation/profile_page.dart';
import 'package:myth/features/tabs/widgets.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/app_router/app_router.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/server/server_config.dart';
import 'package:url_launcher/url_launcher_string.dart'; 
import 'package:flutter_riverpod/flutter_riverpod.dart';


class TabIndexNotifier extends StateNotifier<int> {
  TabIndexNotifier() : super(0);

  void setTabIndex(int index) {
    state = index;
  }
}

final tabIndexProvider = StateNotifierProvider<TabIndexNotifier, int>((ref) {
  return TabIndexNotifier();
});

class TabsPage extends ConsumerStatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class PageTab {
  String route;
  GlobalKey<NavigatorState> navigatorKey;
  PageTab({
    required this.route,
    required this.navigatorKey,
  });
}

class _TabsPageState extends ConsumerState<TabsPage> {
 
 NotchBottomBarController notchBottomBarController = NotchBottomBarController(index: 0);
    
  List<PageTab> pagez = [];
  final _navigatorKeys = List.generate(5, (index) => GlobalKey<NavigatorState>());
  
  @override
  void initState() {
    pagez = [
      PageTab(navigatorKey:_navigatorKeys[0], route:Routes.profile),
      PageTab(navigatorKey:_navigatorKeys[1], route:Routes.appointments),
      // PageTab(navigatorKey:_navigatorKeys[2], route:Routes.patients),
      PageTab(navigatorKey:_navigatorKeys[3], route:Routes.services),
      PageTab(navigatorKey:_navigatorKeys[4], route:Routes.development),
    ];
    
  }

Future<bool> _systemBackButtonPressed(tabIndex) async {
    if (_navigatorKeys[tabIndex].currentState?.canPop() == true) {
      _navigatorKeys[tabIndex]
          .currentState
          ?.pop(_navigatorKeys[tabIndex].currentContext);
      return false;
    } else {
      SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
      return true; // Indicate that the back action is handled
    }
  }
@override


  Widget build(BuildContext context) {
    List<TabButtonModel> tabs = [
      TabButtonModel(active_icon:Icons.person,inactive_icon: Icons.person_outline,title: S.of(context).profile),
      TabButtonModel(active_icon:IconData(0xe900 , fontFamily: "tab_icons" ),inactive_icon: IconData(0xe900 , fontFamily: "tab_icons" ), title: S.of(context).appointments),
      // TabButtonModel(active_icon:IconData(0xe901 , fontFamily: "tab_icons") , inactive_icon: IconData(0xe901 , fontFamily: "tab_icons" ), title: S.of(context).cases),
      TabButtonModel(active_icon:IconData(0xe901 , fontFamily: "tab_icons") , inactive_icon: IconData(0xe901 , fontFamily: "tab_icons" ), title:S.of(context).services),
      TabButtonModel(active_icon:IconData(0xe902 , fontFamily: "tab_icons") , inactive_icon: IconData(0xe902 , fontFamily: "tab_icons" ), title:S.of(context).development),

    ];
    final appRouter = Routes();
    final tabIndex = ref.watch(tabIndexProvider);
ref.listen(tabIndexProvider, (previous, next) {
      if(next==2){
      }
      notchBottomBarController.jumpTo(next);
    });
    
    String _currentTitle = "Home";
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if(state is UserLoggedIn){
          pagez = [
      PageTab(navigatorKey:_navigatorKeys[0], route:Routes.profile),
      PageTab(navigatorKey:_navigatorKeys[1], route:Routes.appointments),
      PageTab(navigatorKey:_navigatorKeys[2], route:Routes.patients),
    ];
    return WillPopScope(
          onWillPop: () => _systemBackButtonPressed(tabIndex),
          child: Scaffold(extendBodyBehindAppBar: true,
            floatingActionButtonLocation: ExpandableFab.location,
            body:  IndexedStack(
              index: tabIndex,
              children: pagez.map((name) {
                return Navigator(
                  key: name.navigatorKey , 
                  onGenerateRoute : 
                  (settings) {
                    if(settings.name=='/') {  
                      switch (name.route) {
                        case Routes.profile: 
                          return profilePage();
                        case Routes.appointments:
                          return appointmentsPage();
                        case  Routes.patients:
                          return casesPage();
                        case  Routes.development:  
                          return developmentPage();
                         case  Routes.services: 
                          return MaterialPageRoute(builder: (_) => ServicesPage());
                          }
                         
                    }
                    else{
                      return appRouter.generatedRoute(settings);
                    } 
                  }
                );
              }).toList(),
            ), 
            bottomNavigationBar: 
            // UserNavigationBar(tabIndex:tabIndex , tabs:tabs),
            DoctorNaigationBar()
          ),
        );
        }
        
      else {
        return ErrorWidget("Something went wring");
      }
      },
    );
  }

  Widget UserNavigationBar({required int tabIndex , required List<TabButtonModel> tabs}) {
    return CubertoBottomBar(
        tabColor: AppColors.primary,
        textColor: AppColors.primary,
        barBackgroundColor: AppColors.primary,
        key: const Key("BottomBar"),
        inactiveIconColor: Colors.white,
        
        tabStyle: CubertoTabStyle.styleNormal,
        selectedTab: tabIndex,
        tabs: tabs
            .map(
              (value) => TabData(
                key: Key(value.title!),
                iconData: value.active_icon,
                title: value.title!,
                tabColor: Colors.white,
                borderRadius: BorderRadius.circular(8)
                // tabGradient: value.tabGradient,
              ),
            )
            .toList(),
          onTabChangedListener: (position, title, color) {
            ref.read(tabIndexProvider.notifier).setTabIndex(position);
        },
      );
  }

  Widget DoctorNaigationBar(){
    List<TabButtonModel> tabs = [
      TabButtonModel(active_icon:Icons.person,inactive_icon: Icons.person_outline,title: S.of(context).profile),
      TabButtonModel(active_icon:IconData(0xe900 , fontFamily: "tab_icons" ),inactive_icon: IconData(0xe900 , fontFamily: "tab_icons" ), title: S.of(context).appointments),
      TabButtonModel(active_icon:IconData(0xe901 , fontFamily: "tab_icons") , inactive_icon: IconData(0xe901 , fontFamily: "tab_icons" ), title: S.of(context).cases),
      // TabButtonModel(active_icon:IconData(0xe901 , fontFamily: "tab_icons") , inactive_icon: IconData(0xe901 , fontFamily: "tab_icons" ), title:S.of(context).services),
      // TabButtonModel(active_icon:IconData(0xe902 , fontFamily: "tab_icons") , inactive_icon: IconData(0xe902 , fontFamily: "tab_icons" ), title:S.of(context).development),

    ];
    return AnimatedNotchBottomBar(
          bottomBarWidth: MediaQuery.of(context).size.width,
              showBottomRadius: true,
              durationInMilliSeconds :100 ,
              color: AppColors.primary,
              
              textOverflow: TextOverflow.visible,
              maxLine: 1,
              textAlign: TextAlign.center, 
              notchBottomBarController: notchBottomBarController,
               bottomBarItems: tabs.map((tab) 
               => bottomBarItem(tab: tab)).toList(),
                onTap: (int index) { 
                  ref.read(tabIndexProvider.notifier).setTabIndex(index);
                 }, 
                kIconSize: 24,
                notchColor: AppColors.primary,
                showTopRadius: true  ,

                kBottomRadius: 0,
                shadowElevation: 2.0,
              );
  }
  Widget fabButtons(){
    return ExpandableFab(
        
        type:ExpandableFabType.up ,
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Ionicons.help),
        fabSize: ExpandableFabSize.regular,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),
      ),
      closeButtonBuilder: DefaultFloatingActionButtonBuilder(
        child: const Icon(Icons.close),
        fabSize: ExpandableFabSize.small,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),
      ),
      children : [
        FloatingActionButton(
            // shape: const CircleBorder(),
            heroTag: null,
            child: const Icon(Ionicons.call, color:Colors.white),
            onPressed: () {
              launchUrlString("tel://${SocialMedia.phone}"); },
          ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            // shape: const CircleBorder(),
            heroTag: null,
            child: const Icon(Ionicons.logo_whatsapp , color:Colors.white),
            onPressed: () {
              launchUrlString("https://wa.me/${SocialMedia.whatsappNumber}");
             },
          ),
      ]
    );
      
  }
}