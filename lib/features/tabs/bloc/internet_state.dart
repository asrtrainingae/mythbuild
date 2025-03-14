part of 'internet_bloc.dart';

abstract class InternetState {}

class InternetInitial extends InternetState {}
class InternetConnectedState extends InternetState {}
class InternetNotConnectedState extends InternetState {}