// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `SWISS VETERINARY CLINIC`
  String get app_name {
    return Intl.message(
      'SWISS VETERINARY CLINIC',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get get_started {
    return Intl.message(
      'Get Started',
      name: 'get_started',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone_number {
    return Intl.message(
      'Phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `patient@self.com`
  String get email_example {
    return Intl.message(
      'patient@self.com',
      name: 'email_example',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Min 8 cyfr`
  String get password_example {
    return Intl.message(
      'Min 8 cyfr',
      name: 'password_example',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgot_your_password {
    return Intl.message(
      'Forgot your password?',
      name: 'forgot_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account? `
  String get dont_have_account {
    return Intl.message(
      'Don’t have an account? ',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Jan Kowalski`
  String get full_name_example {
    return Intl.message(
      'Jan Kowalski',
      name: 'full_name_example',
      desc: '',
      args: [],
    );
  }

  /// `pet details `
  String get pet_details {
    return Intl.message(
      'pet details ',
      name: 'pet_details',
      desc: '',
      args: [],
    );
  }

  /// `optional`
  String get optional {
    return Intl.message(
      'optional',
      name: 'optional',
      desc: '',
      args: [],
    );
  }

  /// `I agree with Terms and `
  String get agree_with_terms_and {
    return Intl.message(
      'I agree with Terms and ',
      name: 'agree_with_terms_and',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Already have account?  `
  String get already_have_account {
    return Intl.message(
      'Already have account?  ',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forget_password {
    return Intl.message(
      'Forget Password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `To reset your password please enter your email address`
  String get to_reset_password {
    return Intl.message(
      'To reset your password please enter your email address',
      name: 'to_reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `search..`
  String get seacrch_example {
    return Intl.message(
      'search..',
      name: 'seacrch_example',
      desc: '',
      args: [],
    );
  }

  /// `Periodic Inspection`
  String get periodic_inspection {
    return Intl.message(
      'Periodic Inspection',
      name: 'periodic_inspection',
      desc: '',
      args: [],
    );
  }

  /// `Surgical Operation`
  String get surgical_operation {
    return Intl.message(
      'Surgical Operation',
      name: 'surgical_operation',
      desc: '',
      args: [],
    );
  }

  /// `Vaccination`
  String get vaccination {
    return Intl.message(
      'Vaccination',
      name: 'vaccination',
      desc: '',
      args: [],
    );
  }

  /// `Slots`
  String get slots {
    return Intl.message(
      'Slots',
      name: 'slots',
      desc: '',
      args: [],
    );
  }

  /// `Slot 1`
  String get slot_1 {
    return Intl.message(
      'Slot 1',
      name: 'slot_1',
      desc: '',
      args: [],
    );
  }

  /// `Slot 2`
  String get slot_2 {
    return Intl.message(
      'Slot 2',
      name: 'slot_2',
      desc: '',
      args: [],
    );
  }

  /// `Slot 3`
  String get slot_3 {
    return Intl.message(
      'Slot 3',
      name: 'slot_3',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Veterinarian`
  String get veterinarian {
    return Intl.message(
      'Veterinarian',
      name: 'veterinarian',
      desc: '',
      args: [],
    );
  }

  /// `specify reason`
  String get specify_reason {
    return Intl.message(
      'specify reason',
      name: 'specify_reason',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Appointments`
  String get upcoming_appointments {
    return Intl.message(
      'Upcoming Appointments',
      name: 'upcoming_appointments',
      desc: '',
      args: [],
    );
  }

  /// `Pet Profiles`
  String get pet_profiles {
    return Intl.message(
      'Pet Profiles',
      name: 'pet_profiles',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get information {
    return Intl.message(
      'Information',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Breed`
  String get breed {
    return Intl.message(
      'Breed',
      name: 'breed',
      desc: '',
      args: [],
    );
  }

  /// `Lifestyle`
  String get lifestyle {
    return Intl.message(
      'Lifestyle',
      name: 'lifestyle',
      desc: '',
      args: [],
    );
  }

  /// `Training`
  String get training {
    return Intl.message(
      'Training',
      name: 'training',
      desc: '',
      args: [],
    );
  }

  /// `Wight`
  String get weight {
    return Intl.message(
      'Wight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Medical Records`
  String get medical_records {
    return Intl.message(
      'Medical Records',
      name: 'medical_records',
      desc: '',
      args: [],
    );
  }

  /// `Telemedicine Services`
  String get telemedicine_services {
    return Intl.message(
      'Telemedicine Services',
      name: 'telemedicine_services',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message(
      'Reports',
      name: 'reports',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Reminder`
  String get reminder {
    return Intl.message(
      'Reminder',
      name: 'reminder',
      desc: '',
      args: [],
    );
  }

  /// `Notice`
  String get notice {
    return Intl.message(
      'Notice',
      name: 'notice',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get add_to_cart {
    return Intl.message(
      'Add to Cart',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Similer To`
  String get similer_to {
    return Intl.message(
      'Similer To',
      name: 'similer_to',
      desc: '',
      args: [],
    );
  }

  /// `Rating&Reviews`
  String get rating_reviews {
    return Intl.message(
      'Rating&Reviews',
      name: 'rating_reviews',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Write a review`
  String get write_review {
    return Intl.message(
      'Write a review',
      name: 'write_review',
      desc: '',
      args: [],
    );
  }

  /// `What is you rate?`
  String get what_is_you_rate {
    return Intl.message(
      'What is you rate?',
      name: 'what_is_you_rate',
      desc: '',
      args: [],
    );
  }

  /// `Please share your opinion about the product`
  String get share_opinion {
    return Intl.message(
      'Please share your opinion about the product',
      name: 'share_opinion',
      desc: '',
      args: [],
    );
  }

  /// `Your review`
  String get your_review {
    return Intl.message(
      'Your review',
      name: 'your_review',
      desc: '',
      args: [],
    );
  }

  /// `SEND REVIEW`
  String get send_review {
    return Intl.message(
      'SEND REVIEW',
      name: 'send_review',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get cart {
    return Intl.message(
      'My Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Total amount`
  String get total_amount {
    return Intl.message(
      'Total amount',
      name: 'total_amount',
      desc: '',
      args: [],
    );
  }

  /// `CHECKOUT`
  String get checkout {
    return Intl.message(
      'CHECKOUT',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Shipping address`
  String get shipping_address {
    return Intl.message(
      'Shipping address',
      name: 'shipping_address',
      desc: '',
      args: [],
    );
  }

  /// `Shipping address required`
  String get shipping_address_required {
    return Intl.message(
      'Shipping address required',
      name: 'shipping_address_required',
      desc: '',
      args: [],
    );
  }

  /// `Payment Methods`
  String get payment_methods {
    return Intl.message(
      'Payment Methods',
      name: 'payment_methods',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'deliver_to ' key

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `credit/debit cards`
  String get debit_carts {
    return Intl.message(
      'credit/debit cards',
      name: 'debit_carts',
      desc: '',
      args: [],
    );
  }

  /// `PayPal`
  String get paypal {
    return Intl.message(
      'PayPal',
      name: 'paypal',
      desc: '',
      args: [],
    );
  }

  /// `Samsung Pay`
  String get samsung_pay {
    return Intl.message(
      'Samsung Pay',
      name: 'samsung_pay',
      desc: '',
      args: [],
    );
  }

  /// `Apple Pay`
  String get apple_pay {
    return Intl.message(
      'Apple Pay',
      name: 'apple_pay',
      desc: '',
      args: [],
    );
  }

  /// `Delivery method`
  String get delivery_method {
    return Intl.message(
      'Delivery method',
      name: 'delivery_method',
      desc: '',
      args: [],
    );
  }

  /// `Apply Coupons`
  String get apply_coupons {
    return Intl.message(
      'Apply Coupons',
      name: 'apply_coupons',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Charge`
  String get delivery_charge {
    return Intl.message(
      'Delivery Charge',
      name: 'delivery_charge',
      desc: '',
      args: [],
    );
  }

  /// `PAY`
  String get pay {
    return Intl.message(
      'PAY',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Card`
  String get card {
    return Intl.message(
      'Card',
      name: 'card',
      desc: '',
      args: [],
    );
  }

  /// `Name on card`
  String get name_on_card {
    return Intl.message(
      'Name on card',
      name: 'name_on_card',
      desc: '',
      args: [],
    );
  }

  /// `Card number`
  String get card_number {
    return Intl.message(
      'Card number',
      name: 'card_number',
      desc: '',
      args: [],
    );
  }

  /// `Expire Date`
  String get expire_date {
    return Intl.message(
      'Expire Date',
      name: 'expire_date',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get CVV {
    return Intl.message(
      'CVV',
      name: 'CVV',
      desc: '',
      args: [],
    );
  }

  /// `Set as default payment method`
  String get set_as_default_payment_method {
    return Intl.message(
      'Set as default payment method',
      name: 'set_as_default_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get order_success {
    return Intl.message(
      'Success!',
      name: 'order_success',
      desc: '',
      args: [],
    );
  }

  /// `Your order will be delivered soon. Thank you for choosing our app!`
  String get order_success_message {
    return Intl.message(
      'Your order will be delivered soon. Thank you for choosing our app!',
      name: 'order_success_message',
      desc: '',
      args: [],
    );
  }

  /// `CONTINUE SHOPPING`
  String get continue_shopping {
    return Intl.message(
      'CONTINUE SHOPPING',
      name: 'continue_shopping',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Addresses`
  String get shipping_addresses {
    return Intl.message(
      'Shipping Addresses',
      name: 'shipping_addresses',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get my_orders {
    return Intl.message(
      'My Orders',
      name: 'my_orders',
      desc: '',
      args: [],
    );
  }

  /// `In Transit`
  String get in_transit {
    return Intl.message(
      'In Transit',
      name: 'in_transit',
      desc: '',
      args: [],
    );
  }

  /// `Track Order`
  String get track_order {
    return Intl.message(
      'Track Order',
      name: 'track_order',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `AED`
  String get aed {
    return Intl.message(
      'AED',
      name: 'aed',
      desc: '',
      args: [],
    );
  }

  /// `Order Status`
  String get order_status {
    return Intl.message(
      'Order Status',
      name: 'order_status',
      desc: '',
      args: [],
    );
  }

  /// `Packing`
  String get packing {
    return Intl.message(
      'Packing',
      name: 'packing',
      desc: '',
      args: [],
    );
  }

  /// `Picked`
  String get picked {
    return Intl.message(
      'Picked',
      name: 'picked',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Guy`
  String get delivery_guy {
    return Intl.message(
      'Delivery Guy',
      name: 'delivery_guy',
      desc: '',
      args: [],
    );
  }

  /// `My Details`
  String get my_details {
    return Intl.message(
      'My Details',
      name: 'my_details',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Emergency Assistance`
  String get emergency_assistance {
    return Intl.message(
      'Emergency Assistance',
      name: 'emergency_assistance',
      desc: '',
      args: [],
    );
  }

  /// `My Reports`
  String get my_reports {
    return Intl.message(
      'My Reports',
      name: 'my_reports',
      desc: '',
      args: [],
    );
  }

  /// `FAQs`
  String get faqs {
    return Intl.message(
      'FAQs',
      name: 'faqs',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get help_center {
    return Intl.message(
      'Help Center',
      name: 'help_center',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get logout_message {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'logout_message',
      desc: '',
      args: [],
    );
  }

  /// `Yes, Logout`
  String get accept_logout {
    return Intl.message(
      'Yes, Logout',
      name: 'accept_logout',
      desc: '',
      args: [],
    );
  }

  /// `No, Cancel`
  String get accept_cancel {
    return Intl.message(
      'No, Cancel',
      name: 'accept_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get email_required {
    return Intl.message(
      'Email is required',
      name: 'email_required',
      desc: '',
      args: [],
    );
  }

  /// `Passowrd is required`
  String get passowrd_required {
    return Intl.message(
      'Passowrd is required',
      name: 'passowrd_required',
      desc: '',
      args: [],
    );
  }

  /// `Clinic`
  String get clinic {
    return Intl.message(
      'Clinic',
      name: 'clinic',
      desc: '',
      args: [],
    );
  }

  /// `Pet Selection`
  String get pet_select {
    return Intl.message(
      'Pet Selection',
      name: 'pet_select',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Pet Image`
  String get pet_image {
    return Intl.message(
      'Pet Image',
      name: 'pet_image',
      desc: '',
      args: [],
    );
  }

  /// `Pet name`
  String get pet_name {
    return Intl.message(
      'Pet name',
      name: 'pet_name',
      desc: '',
      args: [],
    );
  }

  /// `All fields required`
  String get all_fields_required {
    return Intl.message(
      'All fields required',
      name: 'all_fields_required',
      desc: '',
      args: [],
    );
  }

  /// `Initialized`
  String get order_initialized {
    return Intl.message(
      'Initialized',
      name: 'order_initialized',
      desc: '',
      args: [],
    );
  }

  /// `Waiting`
  String get order_waiting {
    return Intl.message(
      'Waiting',
      name: 'order_waiting',
      desc: '',
      args: [],
    );
  }

  /// `On Way`
  String get order_on_way {
    return Intl.message(
      'On Way',
      name: 'order_on_way',
      desc: '',
      args: [],
    );
  }

  /// `In Progress`
  String get order_inprogress {
    return Intl.message(
      'In Progress',
      name: 'order_inprogress',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get order_done {
    return Intl.message(
      'Done',
      name: 'order_done',
      desc: '',
      args: [],
    );
  }

  /// `Keywords`
  String get keywords {
    return Intl.message(
      'Keywords',
      name: 'keywords',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get no_data {
    return Intl.message(
      'No data',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `Make appointment`
  String get make_appointment {
    return Intl.message(
      'Make appointment',
      name: 'make_appointment',
      desc: '',
      args: [],
    );
  }

  /// `Veterinary market`
  String get veterinary_market {
    return Intl.message(
      'Veterinary market',
      name: 'veterinary_market',
      desc: '',
      args: [],
    );
  }

  /// `Veterinary clinic services`
  String get veterinary_clinic_services {
    return Intl.message(
      'Veterinary clinic services',
      name: 'veterinary_clinic_services',
      desc: '',
      args: [],
    );
  }

  /// `About veterinar clinic`
  String get about_veterinar_clinic {
    return Intl.message(
      'About veterinar clinic',
      name: 'about_veterinar_clinic',
      desc: '',
      args: [],
    );
  }

  /// `Top products`
  String get top_products {
    return Intl.message(
      'Top products',
      name: 'top_products',
      desc: '',
      args: [],
    );
  }

  /// `Best offers`
  String get best_offers {
    return Intl.message(
      'Best offers',
      name: 'best_offers',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Successful Created`
  String get appointment_successful_created {
    return Intl.message(
      'Appointment Successful Created',
      name: 'appointment_successful_created',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get call {
    return Intl.message(
      'Call',
      name: 'call',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get resend_code {
    return Intl.message(
      'Resend code',
      name: 'resend_code',
      desc: '',
      args: [],
    );
  }

  /// `Remove from cart`
  String get remove_from_cart {
    return Intl.message(
      'Remove from cart',
      name: 'remove_from_cart',
      desc: '',
      args: [],
    );
  }

  /// `choose time`
  String get choose_time {
    return Intl.message(
      'choose time',
      name: 'choose_time',
      desc: '',
      args: [],
    );
  }

  /// `choose clinic`
  String get choose_clinic {
    return Intl.message(
      'choose clinic',
      name: 'choose_clinic',
      desc: '',
      args: [],
    );
  }

  /// `choose pet`
  String get choose_pet {
    return Intl.message(
      'choose pet',
      name: 'choose_pet',
      desc: '',
      args: [],
    );
  }

  /// `Please Select an Image`
  String get please_select_image {
    return Intl.message(
      'Please Select an Image',
      name: 'please_select_image',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all the details`
  String get please_fill_details {
    return Intl.message(
      'Please fill all the details',
      name: 'please_fill_details',
      desc: '',
      args: [],
    );
  }

  /// `Confirm action`
  String get confirm_action {
    return Intl.message(
      'Confirm action',
      name: 'confirm_action',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete appointment?`
  String get are_you_sure_delete_appointment {
    return Intl.message(
      'Are you sure you want to delete appointment?',
      name: 'are_you_sure_delete_appointment',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Appointments`
  String get appointments {
    return Intl.message(
      'Appointments',
      name: 'appointments',
      desc: '',
      args: [],
    );
  }

  /// `Store`
  String get store {
    return Intl.message(
      'Store',
      name: 'store',
      desc: '',
      args: [],
    );
  }

  /// `Pets`
  String get pets {
    return Intl.message(
      'Pets',
      name: 'pets',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Patients`
  String get patients {
    return Intl.message(
      'Patients',
      name: 'patients',
      desc: '',
      args: [],
    );
  }

  /// `Dania Jubran`
  String get doctor_temp_name {
    return Intl.message(
      'Dania Jubran',
      name: 'doctor_temp_name',
      desc: '',
      args: [],
    );
  }

  /// `Therapist`
  String get therapist {
    return Intl.message(
      'Therapist',
      name: 'therapist',
      desc: '',
      args: [],
    );
  }

  /// `Pediatrics General`
  String get pediatrics_general {
    return Intl.message(
      'Pediatrics General',
      name: 'pediatrics_general',
      desc: '',
      args: [],
    );
  }

  /// `Experiences`
  String get experiences {
    return Intl.message(
      'Experiences',
      name: 'experiences',
      desc: '',
      args: [],
    );
  }

  /// `Working hours`
  String get working_hours {
    return Intl.message(
      'Working hours',
      name: 'working_hours',
      desc: '',
      args: [],
    );
  }

  /// `Therapist Dania Jubran specialises in neonatal care, managing a spectrum from extreme prematurity to full-term infants. Her expertise includes advanced ventilation techniques, cooling therapy for HIE cases, and comprehensive care for paediatric patients. With a focus on preventive health exams and collaboration with subspecialties, she ensures holistic care for newborns and children. Experience Years: 21`
  String get exp_example {
    return Intl.message(
      'Therapist Dania Jubran specialises in neonatal care, managing a spectrum from extreme prematurity to full-term infants. Her expertise includes advanced ventilation techniques, cooling therapy for HIE cases, and comprehensive care for paediatric patients. With a focus on preventive health exams and collaboration with subspecialties, she ensures holistic care for newborns and children. Experience Years: 21',
      name: 'exp_example',
      desc: '',
      args: [],
    );
  }

  /// `Personal information`
  String get personal_information {
    return Intl.message(
      'Personal information',
      name: 'personal_information',
      desc: '',
      args: [],
    );
  }

  /// `Details of the developments`
  String get details_of_developments {
    return Intl.message(
      'Details of the developments',
      name: 'details_of_developments',
      desc: '',
      args: [],
    );
  }

  /// `Speech Treatment`
  String get speech_treatment {
    return Intl.message(
      'Speech Treatment',
      name: 'speech_treatment',
      desc: '',
      args: [],
    );
  }

  /// `Functional Treatment`
  String get functional_treatment {
    return Intl.message(
      'Functional Treatment',
      name: 'functional_treatment',
      desc: '',
      args: [],
    );
  }

  /// `Natural Treatment`
  String get natural_treatment {
    return Intl.message(
      'Natural Treatment',
      name: 'natural_treatment',
      desc: '',
      args: [],
    );
  }

  /// `Show Less Details`
  String get show_less_details {
    return Intl.message(
      'Show Less Details',
      name: 'show_less_details',
      desc: '',
      args: [],
    );
  }

  /// `Therapist name`
  String get therapist_name {
    return Intl.message(
      'Therapist name',
      name: 'therapist_name',
      desc: '',
      args: [],
    );
  }

  /// `Name of the centre`
  String get centre_name {
    return Intl.message(
      'Name of the centre',
      name: 'centre_name',
      desc: '',
      args: [],
    );
  }

  /// `Session report`
  String get session_report {
    return Intl.message(
      'Session report',
      name: 'session_report',
      desc: '',
      args: [],
    );
  }

  /// `The treatment plan`
  String get treatment_plan {
    return Intl.message(
      'The treatment plan',
      name: 'treatment_plan',
      desc: '',
      args: [],
    );
  }

  /// `Language comprehension therapy: this is a unique form of speech therapy that in turn, it helps patients with developmental difficulties and delays in the language that may cause after a stroke or health problems others. Although some patients receiving such speech therapy they can communicate, but they can't use communication skills the right strength...`
  String get treatment_plan_text {
    return Intl.message(
      'Language comprehension therapy: this is a unique form of speech therapy that in turn, it helps patients with developmental difficulties and delays in the language that may cause after a stroke or health problems others. Although some patients receiving such speech therapy they can communicate, but they can\'t use communication skills the right strength...',
      name: 'treatment_plan_text',
      desc: '',
      args: [],
    );
  }

  /// `Therapeutic goals`
  String get therapeutic_goals {
    return Intl.message(
      'Therapeutic goals',
      name: 'therapeutic_goals',
      desc: '',
      args: [],
    );
  }

  /// `Speech retardation speech therapy sessions are an effective way that contributes to helping the child has to get rid of his speech problems, which led to his tardiness in speech, such sessions depend primarily on help the child to speak correctly, increase cognitive awareness and cognitive has to, and do the adjustment of wrong behaviors by evaluating the child will develop a...`
  String get therapeutic_goals_text {
    return Intl.message(
      'Speech retardation speech therapy sessions are an effective way that contributes to helping the child has to get rid of his speech problems, which led to his tardiness in speech, such sessions depend primarily on help the child to speak correctly, increase cognitive awareness and cognitive has to, and do the adjustment of wrong behaviors by evaluating the child will develop a...',
      name: 'therapeutic_goals_text',
      desc: '',
      args: [],
    );
  }

  /// `Completed goals`
  String get completed_goals {
    return Intl.message(
      'Completed goals',
      name: 'completed_goals',
      desc: '',
      args: [],
    );
  }

  /// `Speech retardation speech therapy sessions are an effective way that contributes to helping the child has to get rid of his speech problems, which led to his tardiness in speech, such sessions depend primarily on help the child to speak correctly, increase cognitive awareness and cognitive has to, and do the adjustment of wrong behaviors by evaluating the child will develop a...`
  String get completed_goals_text {
    return Intl.message(
      'Speech retardation speech therapy sessions are an effective way that contributes to helping the child has to get rid of his speech problems, which led to his tardiness in speech, such sessions depend primarily on help the child to speak correctly, increase cognitive awareness and cognitive has to, and do the adjustment of wrong behaviors by evaluating the child will develop a...',
      name: 'completed_goals_text',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Details`
  String get appointment_details {
    return Intl.message(
      'Appointment Details',
      name: 'appointment_details',
      desc: '',
      args: [],
    );
  }

  /// `The Case`
  String get the_case {
    return Intl.message(
      'The Case',
      name: 'the_case',
      desc: '',
      args: [],
    );
  }

  /// `Name of the Case`
  String get case_name {
    return Intl.message(
      'Name of the Case',
      name: 'case_name',
      desc: '',
      args: [],
    );
  }

  /// `Case number`
  String get case_number {
    return Intl.message(
      'Case number',
      name: 'case_number',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number`
  String get mobile_number {
    return Intl.message(
      'Mobile number',
      name: 'mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `Care center name`
  String get care_center_name {
    return Intl.message(
      'Care center name',
      name: 'care_center_name',
      desc: '',
      args: [],
    );
  }

  /// `Diagnosis`
  String get diagnosis {
    return Intl.message(
      'Diagnosis',
      name: 'diagnosis',
      desc: '',
      args: [],
    );
  }

  /// `Many children with Childhood Apraxia of speech face difficulty moving the jaw, lips and tongue to the correct positions to make one of the sounds. They may also have difficulty moving smoothly to the next sound. Children with apraxia of speech are faced with children also have language problems, such as a lack of vocabulary or difficulty word order. Some symptoms may be limited to children wh...`
  String get diagnosis_text {
    return Intl.message(
      'Many children with Childhood Apraxia of speech face difficulty moving the jaw, lips and tongue to the correct positions to make one of the sounds. They may also have difficulty moving smoothly to the next sound. Children with apraxia of speech are faced with children also have language problems, such as a lack of vocabulary or difficulty word order. Some symptoms may be limited to children wh...',
      name: 'diagnosis_text',
      desc: '',
      args: [],
    );
  }

  /// `Short goals Range`
  String get short_goals_range {
    return Intl.message(
      'Short goals Range',
      name: 'short_goals_range',
      desc: '',
      args: [],
    );
  }

  /// `Long goals Range`
  String get long_goals_range {
    return Intl.message(
      'Long goals Range',
      name: 'long_goals_range',
      desc: '',
      args: [],
    );
  }

  /// `List of Short Goals`
  String get list_of_short_goals {
    return Intl.message(
      'List of Short Goals',
      name: 'list_of_short_goals',
      desc: '',
      args: [],
    );
  }

  /// `Goal 1`
  String get goal_1 {
    return Intl.message(
      'Goal 1',
      name: 'goal_1',
      desc: '',
      args: [],
    );
  }

  /// `Goal 2`
  String get goal_2 {
    return Intl.message(
      'Goal 2',
      name: 'goal_2',
      desc: '',
      args: [],
    );
  }

  /// `Goal 3`
  String get goal_3 {
    return Intl.message(
      'Goal 3',
      name: 'goal_3',
      desc: '',
      args: [],
    );
  }

  /// `Goal 4`
  String get goal_4 {
    return Intl.message(
      'Goal 4',
      name: 'goal_4',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Development details`
  String get development_details {
    return Intl.message(
      'Development details',
      name: 'development_details',
      desc: '',
      args: [],
    );
  }

  /// `show more details`
  String get show_more_details {
    return Intl.message(
      'show more details',
      name: 'show_more_details',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Cases`
  String get cases {
    return Intl.message(
      'Cases',
      name: 'cases',
      desc: '',
      args: [],
    );
  }

  /// `Development`
  String get development {
    return Intl.message(
      'Development',
      name: 'development',
      desc: '',
      args: [],
    );
  }

  /// `Types of services`
  String get services_types {
    return Intl.message(
      'Types of services',
      name: 'services_types',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Daily appointments`
  String get daily_appointments {
    return Intl.message(
      'Daily appointments',
      name: 'daily_appointments',
      desc: '',
      args: [],
    );
  }

  /// `Previous appointments`
  String get previous_appointments {
    return Intl.message(
      'Previous appointments',
      name: 'previous_appointments',
      desc: '',
      args: [],
    );
  }

  /// `Fixed appointments`
  String get fixed_appointments {
    return Intl.message(
      'Fixed appointments',
      name: 'fixed_appointments',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get sunday {
    return Intl.message(
      'Sunday',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get monday {
    return Intl.message(
      'Monday',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get tuesday {
    return Intl.message(
      'Tuesday',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get wednesday {
    return Intl.message(
      'Wednesday',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get thursday {
    return Intl.message(
      'Thursday',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get friday {
    return Intl.message(
      'Friday',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get saturday {
    return Intl.message(
      'Saturday',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `Terms and conditions`
  String get terms_and_conditions {
    return Intl.message(
      'Terms and conditions',
      name: 'terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get delete_account {
    return Intl.message(
      'Delete Account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `New Case`
  String get new_case {
    return Intl.message(
      'New Case',
      name: 'new_case',
      desc: '',
      args: [],
    );
  }

  /// `Add your diagnosis`
  String get add_your_diagnosis {
    return Intl.message(
      'Add your diagnosis',
      name: 'add_your_diagnosis',
      desc: '',
      args: [],
    );
  }

  /// `Add other`
  String get add_other {
    return Intl.message(
      'Add other',
      name: 'add_other',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Care Center`
  String get care_center {
    return Intl.message(
      'Care Center',
      name: 'care_center',
      desc: '',
      args: [],
    );
  }

  /// `Status update`
  String get status_update {
    return Intl.message(
      'Status update',
      name: 'status_update',
      desc: '',
      args: [],
    );
  }

  /// `Birth day`
  String get birth_day {
    return Intl.message(
      'Birth day',
      name: 'birth_day',
      desc: '',
      args: [],
    );
  }

  /// `view summary`
  String get view_summary {
    return Intl.message(
      'view summary',
      name: 'view_summary',
      desc: '',
      args: [],
    );
  }

  /// `Sessions`
  String get sessions {
    return Intl.message(
      'Sessions',
      name: 'sessions',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
