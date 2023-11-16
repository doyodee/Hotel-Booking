import 'bloc/sign_in_bloc.dart';import 'models/sign_in_model.dart';import 'package:flutter/material.dart';import 'package:hotel_booking/core/app_export.dart';import 'package:hotel_booking/core/utils/validation_functions.dart';import 'package:hotel_booking/widgets/custom_checkbox_button.dart';import 'package:hotel_booking/widgets/custom_elevated_button.dart';import 'package:hotel_booking/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable
class SignInScreen extends StatelessWidget {SignInScreen({Key? key}) : super(key: key);

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

static Widget builder(BuildContext context) { return BlocProvider<SignInBloc>(create: (context) => SignInBloc(SignInState(signInModelObj: SignInModel()))..add(SignInInitialEvent()), child: SignInScreen()); } 
@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, body: Form(key: _formKey, child: Container(width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 11.v), child: Column(children: [CustomImageView(imagePath: ImageConstant.imgArrowLeft, height: 28.adaptSize, width: 28.adaptSize, alignment: Alignment.centerLeft, onTap: () {onTapImgArrowLeft(context);}), SizedBox(height: 70.v), Align(alignment: Alignment.centerLeft, child: Container(width: 281.h, margin: EdgeInsets.only(right: 99.h), child: Text("msg_login_to_your_account".tr, maxLines: 2, overflow: TextOverflow.ellipsis, style: theme.textTheme.displayMedium!.copyWith(height: 1.50)))), SizedBox(height: 21.v), _buildLogInSection(context), SizedBox(height: 57.v), _buildOrDividerSection(context), SizedBox(height: 33.v), _buildSocialSection(context), SizedBox(height: 49.v), Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(padding: EdgeInsets.only(bottom: 1.v), child: Text("msg_don_t_have_an_account".tr, style: CustomTextStyles.bodyMediumGray50_1)), GestureDetector(onTap: () {onTapTxtSignUp(context);}, child: Padding(padding: EdgeInsets.only(left: 8.h), child: Text("lbl_sign_up".tr, style: theme.textTheme.titleSmall)))]), SizedBox(height: 5.v)]))))); } 
/// Section Widget
Widget _buildLogInSection(BuildContext context) { return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [BlocSelector<SignInBloc, SignInState, TextEditingController?>(selector: (state) => state.emailController, builder: (context, emailController) {return CustomTextFormField(controller: emailController, hintText: "lbl_email".tr, textInputType: TextInputType.emailAddress, prefix: Container(margin: EdgeInsets.fromLTRB(20.h, 20.v, 12.h, 20.v), child: CustomImageView(imagePath: ImageConstant.imgCheckmark, height: 20.adaptSize, width: 20.adaptSize)), prefixConstraints: BoxConstraints(maxHeight: 60.v), validator: (value) {if (value == null || (!isValidEmail(value, isRequired: true))) {return "err_msg_please_enter_valid_email".tr;} return null;}, contentPadding: EdgeInsets.only(top: 21.v, right: 30.h, bottom: 21.v));}), SizedBox(height: 24.v), BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {return CustomTextFormField(controller: state.passwordController, hintText: "lbl_password".tr, textInputAction: TextInputAction.done, textInputType: TextInputType.visiblePassword, prefix: Container(margin: EdgeInsets.fromLTRB(20.h, 20.v, 12.h, 20.v), child: CustomImageView(imagePath: ImageConstant.imgLock, height: 20.adaptSize, width: 20.adaptSize)), prefixConstraints: BoxConstraints(maxHeight: 60.v), suffix: InkWell(onTap: () {context.read<SignInBloc>().add(ChangePasswordVisibilityEvent(value: !state.isShowPassword));}, child: Container(margin: EdgeInsets.fromLTRB(30.h, 20.v, 20.h, 20.v), child: CustomImageView(imagePath: ImageConstant.imgDashboardBlueGray100, height: 20.adaptSize, width: 20.adaptSize))), suffixConstraints: BoxConstraints(maxHeight: 60.v), validator: (value) {if (value == null || (!isValidPassword(value, isRequired: true))) {return "err_msg_please_enter_valid_password".tr;} return null;}, obscureText: state.isShowPassword, contentPadding: EdgeInsets.symmetric(vertical: 21.v));}), SizedBox(height: 24.v), BlocSelector<SignInBloc, SignInState, bool?>(selector: (state) => state.rememberme, builder: (context, rememberme) {return CustomCheckboxButton(text: "lbl_remember_me".tr, value: rememberme, padding: EdgeInsets.symmetric(vertical: 2.v), onChange: (value) {context.read<SignInBloc>().add(ChangeCheckBoxEvent(value: value));});}), SizedBox(height: 24.v), CustomElevatedButton(text: "lbl_sign_in2".tr), SizedBox(height: 28.v), Align(alignment: Alignment.center, child: GestureDetector(onTap: () {onTapTxtForgotThePassword(context);}, child: Text("msg_forgot_the_password".tr, style: CustomTextStyles.titleMediumPrimarySemiBold)))]); } 
/// Section Widget
Widget _buildOrDividerSection(BuildContext context) { return Padding(padding: EdgeInsets.symmetric(horizontal: 10.h), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: [Padding(padding: EdgeInsets.only(top: 11.v, bottom: 9.v), child: SizedBox(width: 96.h, child: Divider())), Text("msg_or_continue_with".tr, style: CustomTextStyles.titleMediumGray50), Padding(padding: EdgeInsets.only(top: 11.v, bottom: 9.v), child: SizedBox(width: 96.h, child: Divider()))])); } 
/// Section Widget
Widget _buildSocialSection(BuildContext context) { return Padding(padding: EdgeInsets.symmetric(horizontal: 38.h), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Container(height: 60.v, width: 88.h, padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 17.v), decoration: AppDecoration.outlineGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16), child: CustomImageView(imagePath: ImageConstant.imgLogosfacebook, height: 24.adaptSize, width: 24.adaptSize, alignment: Alignment.center)), Container(height: 60.v, width: 87.h, margin: EdgeInsets.only(left: 20.h), padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 17.v), decoration: AppDecoration.outlineGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16), child: CustomImageView(imagePath: ImageConstant.imgFrame, height: 24.adaptSize, width: 24.adaptSize, alignment: Alignment.center)), Container(height: 60.v, width: 88.h, margin: EdgeInsets.only(left: 20.h), padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 17.v), decoration: AppDecoration.outlineGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16), child: CustomImageView(imagePath: ImageConstant.imgFrameWhiteA700, height: 24.adaptSize, width: 24.adaptSize, alignment: Alignment.center))])); } 

/// Navigates to the previous screen.
onTapImgArrowLeft(BuildContext context) { NavigatorService.goBack(); } 
/// Navigates to the forgotPasswordScreen when the action is triggered.
onTapTxtForgotThePassword(BuildContext context) { NavigatorService.pushNamed(AppRoutes.forgotPasswordScreen, ); } 
/// Navigates to the signUpBlankScreen when the action is triggered.
onTapTxtSignUp(BuildContext context) { NavigatorService.pushNamed(AppRoutes.signUpBlankScreen, ); } 
 }
