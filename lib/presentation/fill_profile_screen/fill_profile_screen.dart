import 'bloc/fill_profile_bloc.dart';import 'models/fill_profile_model.dart';import 'package:flutter/material.dart';import 'package:hotel_booking/core/app_export.dart';import 'package:hotel_booking/core/utils/validation_functions.dart';import 'package:hotel_booking/widgets/app_bar/appbar_leading_image.dart';import 'package:hotel_booking/widgets/app_bar/appbar_title.dart';import 'package:hotel_booking/widgets/app_bar/custom_app_bar.dart';import 'package:hotel_booking/widgets/custom_drop_down.dart';import 'package:hotel_booking/widgets/custom_elevated_button.dart';import 'package:hotel_booking/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable
class FillProfileScreen extends StatelessWidget {FillProfileScreen({Key? key}) : super(key: key);

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

static Widget builder(BuildContext context) { return BlocProvider<FillProfileBloc>(create: (context) => FillProfileBloc(FillProfileState(fillProfileModelObj: FillProfileModel()))..add(FillProfileInitialEvent()), child: FillProfileScreen()); } 
@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, appBar: _buildAppBar(context), body: Form(key: _formKey, child: Container(width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.v), child: Column(children: [_buildAvatar(context), SizedBox(height: 24.v), _buildFullNameEditText(context), SizedBox(height: 24.v), _buildNameEditText(context), SizedBox(height: 24.v), _buildDateOfBirthEditText(context), SizedBox(height: 24.v), _buildEmailEditText(context), SizedBox(height: 24.v), _buildPhoneNumberEditText(context), SizedBox(height: 24.v), BlocSelector<FillProfileBloc, FillProfileState, FillProfileModel?>(selector: (state) => state.fillProfileModelObj, builder: (context, fillProfileModelObj) {return CustomDropDown(icon: Container(margin: EdgeInsets.fromLTRB(30.h, 18.v, 20.h, 18.v), child: CustomImageView(imagePath: ImageConstant.imgFavorite, height: 20.adaptSize, width: 20.adaptSize)), hintText: "lbl_gender".tr, items: fillProfileModelObj?.dropdownItemList ?? [], onChanged: (value) {context.read<FillProfileBloc>().add(ChangeDropDownEvent(value: value));});}), SizedBox(height: 5.v)]))), bottomNavigationBar: _buildContinueButton(context))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(height: 52.v, leadingWidth: 52.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgArrowLeft, margin: EdgeInsets.only(left: 24.h, top: 11.v, bottom: 13.v), onTap: () {onTapArrowLeft(context);}), centerTitle: true, title: AppbarTitle(text: "msg_fill_your_profile".tr)); } 
/// Section Widget
Widget _buildAvatar(BuildContext context) { return GestureDetector(onTap: () {onTapAvatar(context);}, child: SizedBox(height: 140.adaptSize, width: 140.adaptSize, child: Stack(alignment: Alignment.bottomRight, children: [CustomImageView(imagePath: ImageConstant.imgEllipse, height: 140.adaptSize, width: 140.adaptSize, radius: BorderRadius.circular(70.h), alignment: Alignment.center), CustomImageView(imagePath: ImageConstant.imgEdit, height: 35.adaptSize, width: 35.adaptSize, alignment: Alignment.bottomRight)]))); } 
/// Section Widget
Widget _buildFullNameEditText(BuildContext context) { return BlocSelector<FillProfileBloc, FillProfileState, TextEditingController?>(selector: (state) => state.fullNameEditTextController, builder: (context, fullNameEditTextController) {return CustomTextFormField(controller: fullNameEditTextController, hintText: "lbl_full_name".tr, validator: (value) {if (!isText(value)) {return "err_msg_please_enter_valid_text".tr;} return null;});}); } 
/// Section Widget
Widget _buildNameEditText(BuildContext context) { return BlocSelector<FillProfileBloc, FillProfileState, TextEditingController?>(selector: (state) => state.nameEditTextController, builder: (context, nameEditTextController) {return CustomTextFormField(controller: nameEditTextController, hintText: "lbl_nickname".tr, validator: (value) {if (!isText(value)) {return "err_msg_please_enter_valid_text".tr;} return null;});}); } 
/// Section Widget
Widget _buildDateOfBirthEditText(BuildContext context) { return BlocSelector<FillProfileBloc, FillProfileState, TextEditingController?>(selector: (state) => state.dateOfBirthEditTextController, builder: (context, dateOfBirthEditTextController) {return CustomTextFormField(controller: dateOfBirthEditTextController, hintText: "lbl_date_of_birth".tr, suffix: Container(margin: EdgeInsets.fromLTRB(30.h, 18.v, 20.h, 18.v), child: CustomImageView(imagePath: ImageConstant.imgIconlyCurvedCalendar, height: 20.adaptSize, width: 20.adaptSize)), suffixConstraints: BoxConstraints(maxHeight: 56.v), contentPadding: EdgeInsets.only(left: 20.h, top: 19.v, bottom: 19.v));}); } 
/// Section Widget
Widget _buildEmailEditText(BuildContext context) { return BlocSelector<FillProfileBloc, FillProfileState, TextEditingController?>(selector: (state) => state.emailEditTextController, builder: (context, emailEditTextController) {return CustomTextFormField(controller: emailEditTextController, hintText: "lbl_email".tr, textInputType: TextInputType.emailAddress, suffix: Container(margin: EdgeInsets.fromLTRB(30.h, 20.v, 22.h, 20.v), child: CustomImageView(imagePath: ImageConstant.imgCheckmarkBlueGray100, height: 15.adaptSize, width: 15.adaptSize)), suffixConstraints: BoxConstraints(maxHeight: 56.v), validator: (value) {if (value == null || (!isValidEmail(value, isRequired: true))) {return "err_msg_please_enter_valid_email".tr;} return null;}, contentPadding: EdgeInsets.only(left: 20.h, top: 19.v, bottom: 19.v));}); } 
/// Section Widget
Widget _buildPhoneNumberEditText(BuildContext context) { return BlocSelector<FillProfileBloc, FillProfileState, TextEditingController?>(selector: (state) => state.phoneNumberEditTextController, builder: (context, phoneNumberEditTextController) {return CustomTextFormField(controller: phoneNumberEditTextController, hintText: "lbl_phone_number".tr, textInputAction: TextInputAction.done, textInputType: TextInputType.phone, prefix: Padding(padding: EdgeInsets.fromLTRB(20.h, 19.v, 30.h, 19.v), child: Row(mainAxisSize: MainAxisSize.min, children: [CustomImageView(imagePath: ImageConstant.imageNotFound, height: 18.v, width: 24.h, margin: EdgeInsets.fromLTRB(20.h, 19.v, 30.h, 19.v)), CustomImageView(imagePath: ImageConstant.imageNotFound, height: 4.67.v, width: 9.33.h)])), prefixConstraints: BoxConstraints(maxHeight: 56.v), validator: (value) {if (!isValidPhone(value)) {return "err_msg_please_enter_valid_phone_number".tr;} return null;}, contentPadding: EdgeInsets.only(top: 19.v, right: 30.h, bottom: 19.v));}); } 
/// Section Widget
Widget _buildContinueButton(BuildContext context) { return CustomElevatedButton(text: "lbl_continue".tr, margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 52.v)); } 

/// Navigates to the previous screen.
onTapArrowLeft(BuildContext context) { NavigatorService.goBack(); } 
/// Requests permission to access the camera and storage, and displays a model
/// sheet for selecting images.
///
/// Throws an error if permission is denied or an error occurs while selecting images.
onTapAvatar(BuildContext context) async  { await PermissionManager.askForPermission(Permission.camera);await PermissionManager.askForPermission(Permission.storage);List<String?>? imageList = [];await FileManager().showModelSheetForImage(getImages: (value) async {imageList = value;}); } 
 }
