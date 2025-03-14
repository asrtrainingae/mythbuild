import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myth/features/appointments/bloc/appointment_bloc.dart';
import 'package:myth/features/appointments/presentation/appointment_details.dart';
import 'package:myth/features/appointments/presentation/appointments.dart';
import 'package:myth/features/appointments/presentation/appointments_by_day.dart';
import 'package:myth/features/appointments/presentation/appointments_daily.dart';
import 'package:myth/features/appointments/presentation/appointments_fixed.dart';
import 'package:myth/features/appointments/data/models/appointment.dart';
import 'package:myth/features/appointments/data/models/medical_service.dart';
import 'package:myth/features/appointments/presentation/appointments_fixed_details.dart';
import 'package:myth/features/appointments/presentation/upcoming_appointments.dart';
import 'package:myth/features/auth/bloc/auth_bloc.dart';
import 'package:myth/features/auth/view/forget_password/forget_password.dart';
import 'package:myth/features/auth/view/login/login_screen.dart';
import 'package:myth/features/development/cubit/development_cubit.dart';
import 'package:myth/features/development/presentation/development.dart';
import 'package:myth/features/development/presentation/development_details.dart';
import 'package:myth/features/notifications/bloc/notifications_bloc.dart';
import 'package:myth/features/notifications/presentation/notifications_page.dart';
import 'package:myth/features/patients/bloc/cases_bloc.dart';
import 'package:myth/features/patients/cubit/cases_cubit.dart';
import 'package:myth/features/patients/data/case_model.dart';
import 'package:myth/features/patients/presentation/add_patient_page.dart';
import 'package:myth/features/patients/presentation/cases_page.dart';
import 'package:myth/features/patients/presentation/sessions_page.dart';
import 'package:myth/features/services/presentation/service_page.dart';
import 'package:myth/features/services/presentation/services_page.dart';
import 'package:myth/features/settings/presentation/profile_edit_page.dart';
import 'package:myth/features/settings/presentation/profile_page.dart';
import 'package:myth/features/settings/presentation/settings_page.dart';
import 'package:myth/features/tabs/tabs_screen.dart';
import 'package:myth/services/dependency_injector.dart';
part 'helper.dart';

class Routes {
  static const String initRoute = "/";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String tabs = "/tabs";
  static const String notifications = "/notifications";
  static const String forget_password = "/forget_password";
  static const String product = "/product";
  static const String patients = "/patients";
  static const String cart = "/cart";
  static const String upcoming_appointments = "/upcoming_appointments";
  static const String checkout = "/checkout";
  static const String success_page = "/success_page";
  static const String payment_card = "/payment_card";
  static const String address = "/address";
  static const String orders = "/orders";
  static const String order = "/order";
  static const String settings_page = "/settings";
  static const String profile = "/profile";
  static const String profileEdit = "/profileEdit";
  static const String faqs = "/faqs";
  static const String appointment_schedule = "/appointment_schedule";
  static const String appointments = "/appointments";
  static const String reports = "/reports";
  static const String add_pet = "/add_pet";
  static const String confirm_password = "/confirm_password";
  static const String products = "/products";
  static const String reset_password = "/reset_password";
  static const String pets = "/pets";
  static const String store = "/store";
  static const String home = "/home";
  static const String edit_appointment = "/edit_appointment";
  static const String add_patient = "/add_patient";
  static const String daily_appointments = "/daily_appointments";
  static const String appointment_details = "/appointment_details";
  static const String appointment_fixed = "/appointment_fixed";
  static const String appointments_by_day = "/appointments_by_day";
  static const String development = "/development";
  static const String services = "/services";
  static const String development_details = "/development_details";
  static const String service = "/service";
  static const String sessions = "/sessions";

  Route? generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case initRoute:
        // return MaterialPageRoute(builder: (BuildContext context) => ConfirmPasswordPage()
        return loginPage();
      // return MaterialPageRoute(builder: (BuildContext context) => SplashPage()
      // return MaterialPageRoute(builder: (BuildContext context) =>
      //  BlocProvider<CartBloc>(create: (BuildContext context) =>di.sl<CartBloc>(),
      //  child: ProductPage() ,
      // )

      // return MaterialPageRoute(builder: (BuildContext context) => TodosPage());

      case login:
        return MaterialPageRoute(
            builder: (BuildContext context) => loginPage());
      case service:
        return MaterialPageRoute(
            builder: (BuildContext context) => ServicePage(
                  serviceName: settings.arguments as String,
                ));
      case sessions:
        var userCase = settings.arguments as Case;
        return MaterialPageRoute(
            builder: (BuildContext context) => SessionsPage(userCase: userCase));
      case services:
        return MaterialPageRoute(
            builder: (BuildContext context) => ServicesPage());
      case add_patient:
        return MaterialPageRoute(
            builder: (BuildContext context) => AddPatientPage());
      case appointment_details:
        var data = settings.arguments as Appointment;
        return MaterialPageRoute(
            builder: (BuildContext context) => AppointmentDetails(appointment: data,));
      case appointment_fixed:
        return fixedAppointments();
      case appointments_by_day:
        return MaterialPageRoute(
            builder: (BuildContext context) => AppointmentsByDayPage());
      case development:
        return developmentPage();
      case development_details:
        return developmentDetails();
      case upcoming_appointments:
        return MaterialPageRoute(
            builder: (BuildContext context) => UpcomingAppointmentsPage());
      case signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => loginPage());
      case forget_password:
        return MaterialPageRoute(
            builder: (BuildContext context) => ForgetPasswordPage());
      case tabs:
        return tabsPage();
      case notifications:
        return notificationsPage();
      // case edit_appointment :
      //   var data = settings.arguments as Appointment;
      //   return MaterialPageRoute(builder: (BuildContext context) => EditAppointmentPage(appointment: data));
      // case address :
      //   return MaterialPageRoute(builder: (BuildContext context) => AddressPage());
      case settings_page:
        return settingsPage();
      case profile:
        return MaterialPageRoute(
            builder: (BuildContext context) => ProfilePage());
      case profileEdit:
        return MaterialPageRoute(
            builder: (BuildContext context) => ProfileEditPage());
      case appointments:
        return MaterialPageRoute(
            builder: (BuildContext context) => AppointmentsPage());
      case daily_appointments:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider.value(
                  value: AppointmentBloc(),
                  child: DailyAppointmentsPage(),
                ));
      case confirm_password:
        var data = settings.arguments as String;
        return MaterialPageRoute(
            builder: (BuildContext context) => loginPage());
      default:
        return MaterialPageRoute(builder: (BuildContext context) => TabsPage());
    }
  }
}

enum ProductsSearchType { text, category }

class ProductSearchData {
  ProductsSearchType type;
  String? text;
  String? categoryId;
  ProductSearchData({required this.type, this.text, this.categoryId});
}
