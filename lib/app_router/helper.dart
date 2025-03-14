part of 'app_router.dart';

// splashScreen() {
//   return MaterialPageRoute(
//       builder: (BuildContext context) => BlocProvider.value(
//             value: sl<AuthBloc>(),
//             child: SplashScreen(),
//           ));
// }

loginPage() {
  return MaterialPageRoute(
      builder: (BuildContext context) => BlocProvider.value(
            value: sl<AuthBloc>(),
            child: LoginPage(),
          ));
}

profilePage() {
  return MaterialPageRoute(
      builder: (BuildContext context) => BlocProvider.value(
            value: sl<AuthBloc>(),
            child: ProfilePage(),
          ));
}

fixedAppointments() {
  return MaterialPageRoute(
      builder: (BuildContext context) => BlocProvider.value(
            value:  AppointmentBloc(),
            child: FixedAppointmentsPage(),
          ));
}

notificationsPage() {
  return MaterialPageRoute(
      builder: (BuildContext context) => BlocProvider.value(
            value:  sl<NotificationsBloc>()..add(NotificationsEvent.started()),
            child: NotificationsPage(),
          ));
}


fixedAppointmentDetails(appoimtnent) {
  return MaterialPageRoute(
      builder: (BuildContext context) => BlocProvider.value(
            value:  AppointmentBloc(),
            child: AppointmentsFixedDetailsPage(appointment: appoimtnent),
          ));
}
developmentDetails() {
  return MaterialPageRoute(
      builder: (BuildContext context) => BlocProvider.value(
            value:  DevelopmentCubit()..fetchDevelopments(),
            child: DevelopmentDetailsPage(),
          ));
}
developmentPage() {
  return MaterialPageRoute(
      builder: (BuildContext context) => BlocProvider.value(
            value:  DevelopmentCubit()..fetchDevelopments(),
            child: DevelopmentPage(),
          ));
}

settingsPage() {
  return MaterialPageRoute(
      builder: (BuildContext context) => BlocProvider.value(
            value:  AuthBloc(),
            child: SettingsPage(),
          ));
}
tabsPage() {
  return MaterialPageRoute(
      builder: (BuildContext context) => BlocProvider.value(
            value:  AuthBloc(),
            child: TabsPage(),
          ));
}

appointmentsPage() {
  return MaterialPageRoute(
      builder: (BuildContext context) => BlocProvider.value(
            value:  AuthBloc(),
            child: AppointmentsPage(),
          ));
}
casesPage() {
  return MaterialPageRoute(
      builder: (BuildContext context) => BlocProvider.value(
            value : CasesBloc()..add(CasesEvent.started()), 
            child: PatientsDetailsPage(),
          ));
}
// signupScreen() {
//   return MaterialPageRoute(
//       builder: (BuildContext context) => BlocProvider.value(
//             value: sl<AuthBloc>(),
//             child: SignupScreen(),
//           ));
// }

// wishlistScreen() {
//   return MaterialPageRoute(
//       builder: (BuildContext context) => BlocProvider.value(
//             value: sl<WishlistBloc>(),
//             child: WishlistScreen(),
//           ));
// }

// adDetailsScreen(Ad data) {
//   return MaterialPageRoute(
//       builder: (BuildContext context) => BlocProvider.value(
//             // create: (context) => WishlistBloc(),
//             value: WishlistBloc(),
//             child: AdDetailsScreen(ad: data),
//           ));
// }
