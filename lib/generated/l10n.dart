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

  /// `Welcome Back`
  String get loginTitle {
    return Intl.message(
      'Welcome Back',
      name: 'loginTitle',
      desc: 'Login screen welcome title',
      args: [],
    );
  }

  /// `Enter your email and password to sign in`
  String get loginSubtitle {
    return Intl.message(
      'Enter your email and password to sign in',
      name: 'loginSubtitle',
      desc: 'Login screen subtitle',
      args: [],
    );
  }

  /// `Email`
  String get emailLabel {
    return Intl.message(
      'Email',
      name: 'emailLabel',
      desc: 'Email input label',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message(
      'Password',
      name: 'passwordLabel',
      desc: 'Password input label',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileLabel {
    return Intl.message(
      'Mobile Number',
      name: 'mobileLabel',
      desc: 'Mobile number input label',
      args: [],
    );
  }

  /// `Sign In`
  String get loginButton {
    return Intl.message(
      'Sign In',
      name: 'loginButton',
      desc: 'Login button text',
      args: [],
    );
  }

  /// `Sign Out`
  String get logoutButton {
    return Intl.message(
      'Sign Out',
      name: 'logoutButton',
      desc: 'Logout button text',
      args: [],
    );
  }

  /// `You do not have permission to access this app`
  String get roleRejectionError {
    return Intl.message(
      'You do not have permission to access this app',
      name: 'roleRejectionError',
      desc: 'Error shown when user role is not authorized',
      args: [],
    );
  }

  /// `Your account is suspended, please contact support`
  String get suspendedAccountError {
    return Intl.message(
      'Your account is suspended, please contact support',
      name: 'suspendedAccountError',
      desc: 'Error shown when account is suspended',
      args: [],
    );
  }

  /// `Invalid credentials`
  String get invalidCredentialsError {
    return Intl.message(
      'Invalid credentials',
      name: 'invalidCredentialsError',
      desc: 'Error shown when credentials are invalid',
      args: [],
    );
  }

  /// `Email is not verified, please check your inbox`
  String get emailNotVerifiedError {
    return Intl.message(
      'Email is not verified, please check your inbox',
      name: 'emailNotVerifiedError',
      desc: 'Error shown when email is not verified',
      args: [],
    );
  }

  /// `Details`
  String get stepBasicInfo {
    return Intl.message(
      'Details',
      name: 'stepBasicInfo',
      desc: 'Step name: basic info',
      args: [],
    );
  }

  /// `Photos`
  String get stepPhotoAndLocation {
    return Intl.message(
      'Photos',
      name: 'stepPhotoAndLocation',
      desc: 'Step name: photo and location',
      args: [],
    );
  }

  /// `Location`
  String get stepClassification {
    return Intl.message(
      'Location',
      name: 'stepClassification',
      desc: 'Step name: classification / location',
      args: [],
    );
  }

  /// `Next`
  String get nextButton {
    return Intl.message(
      'Next',
      name: 'nextButton',
      desc: 'Next button text',
      args: [],
    );
  }

  /// `Save`
  String get saveButton {
    return Intl.message(
      'Save',
      name: 'saveButton',
      desc: 'Save button text',
      args: [],
    );
  }

  /// `Submit`
  String get submitButton {
    return Intl.message(
      'Submit',
      name: 'submitButton',
      desc: 'Submit button text',
      args: [],
    );
  }

  /// `Add New Service Provider`
  String get addProviderTitle {
    return Intl.message(
      'Add New Service Provider',
      name: 'addProviderTitle',
      desc: 'Add provider screen title',
      args: [],
    );
  }

  /// `Provider Name (Arabic)`
  String get providerNameAr {
    return Intl.message(
      'Provider Name (Arabic)',
      name: 'providerNameAr',
      desc: 'Provider name in Arabic field label',
      args: [],
    );
  }

  /// `Provider Name (English)`
  String get providerNameEn {
    return Intl.message(
      'Provider Name (English)',
      name: 'providerNameEn',
      desc: 'Provider name in English field label',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: 'Mobile number field label',
      args: [],
    );
  }

  /// `Second Mobile Number`
  String get secondMobile {
    return Intl.message(
      'Second Mobile Number',
      name: 'secondMobile',
      desc: 'Second mobile number field label',
      args: [],
    );
  }

  /// `Contact Person`
  String get contactPerson {
    return Intl.message(
      'Contact Person',
      name: 'contactPerson',
      desc: 'Contact person field label',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: 'Notes field label',
      args: [],
    );
  }

  /// `Service Type`
  String get serviceType {
    return Intl.message(
      'Service Type',
      name: 'serviceType',
      desc: 'Service type dropdown label',
      args: [],
    );
  }

  /// `City`
  String get cityLabel {
    return Intl.message(
      'City',
      name: 'cityLabel',
      desc: 'City dropdown label',
      args: [],
    );
  }

  /// `District`
  String get districtLabel {
    return Intl.message(
      'District',
      name: 'districtLabel',
      desc: 'District dropdown label',
      args: [],
    );
  }

  /// `Categories`
  String get categoriesLabel {
    return Intl.message(
      'Categories',
      name: 'categoriesLabel',
      desc: 'Categories dropdown label',
      args: [],
    );
  }

  /// `Take Photo`
  String get takePhoto {
    return Intl.message(
      'Take Photo',
      name: 'takePhoto',
      desc: 'Take photo option in image picker',
      args: [],
    );
  }

  /// `Select from Gallery`
  String get selectFromGallery {
    return Intl.message(
      'Select from Gallery',
      name: 'selectFromGallery',
      desc: 'Select from gallery option in image picker',
      args: [],
    );
  }

  /// `Select Location`
  String get selectLocation {
    return Intl.message(
      'Select Location',
      name: 'selectLocation',
      desc: 'Select location button text',
      args: [],
    );
  }

  /// `At least one provider name (Arabic or English) is required`
  String get validationAtLeastOneName {
    return Intl.message(
      'At least one provider name (Arabic or English) is required',
      name: 'validationAtLeastOneName',
      desc: 'Validation: at least one name required',
      args: [],
    );
  }

  /// `Mobile number is required`
  String get validationMobileRequired {
    return Intl.message(
      'Mobile number is required',
      name: 'validationMobileRequired',
      desc: 'Validation: mobile number required',
      args: [],
    );
  }

  /// `At least one image is required`
  String get validationImageRequired {
    return Intl.message(
      'At least one image is required',
      name: 'validationImageRequired',
      desc: 'Validation: at least one image required',
      args: [],
    );
  }

  /// `Please select a location on the map`
  String get validationLocationRequired {
    return Intl.message(
      'Please select a location on the map',
      name: 'validationLocationRequired',
      desc: 'Validation: location required',
      args: [],
    );
  }

  /// `Service type is required`
  String get validationTypeRequired {
    return Intl.message(
      'Service type is required',
      name: 'validationTypeRequired',
      desc: 'Validation: service type required',
      args: [],
    );
  }

  /// `District is required`
  String get validationDistrictRequired {
    return Intl.message(
      'District is required',
      name: 'validationDistrictRequired',
      desc: 'Validation: district required',
      args: [],
    );
  }

  /// `My Service Providers`
  String get myProvidersTitle {
    return Intl.message(
      'My Service Providers',
      name: 'myProvidersTitle',
      desc: 'My Providers screen title',
      args: [],
    );
  }

  /// `All`
  String get filterAll {
    return Intl.message(
      'All',
      name: 'filterAll',
      desc: 'Filter chip: all',
      args: [],
    );
  }

  /// `Pending`
  String get filterPending {
    return Intl.message(
      'Pending',
      name: 'filterPending',
      desc: 'Filter chip: pending',
      args: [],
    );
  }

  /// `Approved`
  String get filterApproved {
    return Intl.message(
      'Approved',
      name: 'filterApproved',
      desc: 'Filter chip: approved',
      args: [],
    );
  }

  /// `Declined`
  String get filterDeclined {
    return Intl.message(
      'Declined',
      name: 'filterDeclined',
      desc: 'Filter chip: declined',
      args: [],
    );
  }

  /// `Today`
  String get filterToday {
    return Intl.message(
      'Today',
      name: 'filterToday',
      desc: 'Filter chip: today',
      args: [],
    );
  }

  /// `This Week`
  String get filterThisWeek {
    return Intl.message(
      'This Week',
      name: 'filterThisWeek',
      desc: 'Filter chip: this week',
      args: [],
    );
  }

  /// `This Month`
  String get filterThisMonth {
    return Intl.message(
      'This Month',
      name: 'filterThisMonth',
      desc: 'Filter chip: this month',
      args: [],
    );
  }

  /// `Provider Details`
  String get providerDetailTitle {
    return Intl.message(
      'Provider Details',
      name: 'providerDetailTitle',
      desc: 'Provider detail screen title',
      args: [],
    );
  }

  /// `Edit`
  String get editButton {
    return Intl.message(
      'Edit',
      name: 'editButton',
      desc: 'Edit button text',
      args: [],
    );
  }

  /// `Under Review`
  String get statusPending {
    return Intl.message(
      'Under Review',
      name: 'statusPending',
      desc: 'Status label: pending',
      args: [],
    );
  }

  /// `Approved`
  String get statusApproved {
    return Intl.message(
      'Approved',
      name: 'statusApproved',
      desc: 'Status label: approved',
      args: [],
    );
  }

  /// `Declined`
  String get statusDeclined {
    return Intl.message(
      'Declined',
      name: 'statusDeclined',
      desc: 'Status label: declined',
      args: [],
    );
  }

  /// `Submission Queue`
  String get queueTitle {
    return Intl.message(
      'Submission Queue',
      name: 'queueTitle',
      desc: 'Queue screen title',
      args: [],
    );
  }

  /// `Pending`
  String get queueStatusPending {
    return Intl.message(
      'Pending',
      name: 'queueStatusPending',
      desc: 'Queue item status: pending',
      args: [],
    );
  }

  /// `Uploading image...`
  String get queueUploadingImage {
    return Intl.message(
      'Uploading image...',
      name: 'queueUploadingImage',
      desc: 'Queue status: uploading image',
      args: [],
    );
  }

  /// `Submitting...`
  String get queueSubmitting {
    return Intl.message(
      'Submitting...',
      name: 'queueSubmitting',
      desc: 'Queue status: submitting',
      args: [],
    );
  }

  /// `Submission failed`
  String get queueFailed {
    return Intl.message(
      'Submission failed',
      name: 'queueFailed',
      desc: 'Queue status: failed',
      args: [],
    );
  }

  /// `Submitted successfully`
  String get queueCompleted {
    return Intl.message(
      'Submitted successfully',
      name: 'queueCompleted',
      desc: 'Queue status: completed',
      args: [],
    );
  }

  /// `Retry`
  String get retryButton {
    return Intl.message(
      'Retry',
      name: 'retryButton',
      desc: 'Retry button text',
      args: [],
    );
  }

  /// `No items in the queue`
  String get queueEmpty {
    return Intl.message(
      'No items in the queue',
      name: 'queueEmpty',
      desc: 'Message when queue is empty',
      args: [],
    );
  }

  /// `Request saved and will be sent automatically when back online`
  String get queuedOfflineMessage {
    return Intl.message(
      'Request saved and will be sent automatically when back online',
      name: 'queuedOfflineMessage',
      desc: 'Message when provider submission queued offline',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: 'Generic loading text',
      args: [],
    );
  }

  /// `An error occurred`
  String get error {
    return Intl.message(
      'An error occurred',
      name: 'error',
      desc: 'Generic error text',
      args: [],
    );
  }

  /// `Operation completed successfully`
  String get success {
    return Intl.message(
      'Operation completed successfully',
      name: 'success',
      desc: 'Generic success text',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Cancel button text',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: 'Save button text (common)',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: 'Next button text (common)',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: 'Back button text',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: 'Logout action text',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: 'Confirm button text',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: 'Close button text',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: 'Delete button text',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: 'Delete account option text',
      args: [],
    );
  }

  /// `Are you sure you want to permanently delete your account?`
  String get deleteAccountConfirmation {
    return Intl.message(
      'Are you sure you want to permanently delete your account?',
      name: 'deleteAccountConfirmation',
      desc: 'Delete account confirmation message',
      args: [],
    );
  }

  /// `Account deletion request has been sent`
  String get deleteAccountRequestSent {
    return Intl.message(
      'Account deletion request has been sent',
      name: 'deleteAccountRequestSent',
      desc: 'Confirmation that delete account request was sent',
      args: [],
    );
  }

  /// `User Information`
  String get userInfo {
    return Intl.message(
      'User Information',
      name: 'userInfo',
      desc: 'User info menu option and dialog title',
      args: [],
    );
  }

  /// `Welcome to the Dashboard`
  String get homeWelcomeTitle {
    return Intl.message(
      'Welcome to the Dashboard',
      name: 'homeWelcomeTitle',
      desc: 'Home screen welcome title',
      args: [],
    );
  }

  /// `Manage service offices and providers with ease`
  String get homeWelcomeSubtitle {
    return Intl.message(
      'Manage service offices and providers with ease',
      name: 'homeWelcomeSubtitle',
      desc: 'Home screen welcome subtitle',
      args: [],
    );
  }

  /// `Add Service Provider`
  String get addProviderAction {
    return Intl.message(
      'Add Service Provider',
      name: 'addProviderAction',
      desc: 'Home action card: add provider',
      args: [],
    );
  }

  /// `View Service Providers`
  String get viewProvidersAction {
    return Intl.message(
      'View Service Providers',
      name: 'viewProvidersAction',
      desc: 'Home action card: view providers',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: 'No internet connection message',
      args: [],
    );
  }

  /// `Get My Current Location`
  String get getCurrentLocation {
    return Intl.message(
      'Get My Current Location',
      name: 'getCurrentLocation',
      desc: 'Button to get current GPS location',
      args: [],
    );
  }

  /// `Service Description`
  String get descriptionLabel {
    return Intl.message(
      'Service Description',
      name: 'descriptionLabel',
      desc: 'Description field label',
      args: [],
    );
  }

  /// `Address`
  String get addressLabel {
    return Intl.message(
      'Address',
      name: 'addressLabel',
      desc: 'Address field label',
      args: [],
    );
  }

  /// `Account Verification`
  String get verificationTitle {
    return Intl.message(
      'Account Verification',
      name: 'verificationTitle',
      desc: 'Account verification screen title',
      args: [],
    );
  }

  /// `Enter the verification code sent to your mobile`
  String get verificationSubtitle {
    return Intl.message(
      'Enter the verification code sent to your mobile',
      name: 'verificationSubtitle',
      desc: 'Account verification screen subtitle',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message(
      'Resend Code',
      name: 'resendCode',
      desc: 'Resend verification code button',
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
