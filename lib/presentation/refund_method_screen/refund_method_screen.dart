import 'bloc/refund_method_bloc.dart';import 'models/refund_method_model.dart';import 'package:flutter/material.dart';import 'package:hotel_booking/core/app_export.dart';import 'package:hotel_booking/widgets/app_bar/appbar_leading_image.dart';import 'package:hotel_booking/widgets/app_bar/appbar_title.dart';import 'package:hotel_booking/widgets/app_bar/custom_app_bar.dart';import 'package:hotel_booking/widgets/custom_elevated_button.dart';import 'package:hotel_booking/widgets/custom_radio_button.dart';class RefundMethodScreen extends StatelessWidget {const RefundMethodScreen({Key? key}) : super(key: key);

static Widget builder(BuildContext context) { return BlocProvider<RefundMethodBloc>(create: (context) => RefundMethodBloc(RefundMethodState(refundMethodModelObj: RefundMethodModel()))..add(RefundMethodInitialEvent()), child: RefundMethodScreen()); } 
@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(appBar: _buildAppBar(context), body: Container(width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 22.v), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [SizedBox(height: 4.v), Container(width: 357.h, margin: EdgeInsets.only(right: 22.h), child: Text("msg_please_select_a".tr, maxLines: 2, overflow: TextOverflow.ellipsis, style: CustomTextStyles.bodyLarge18.copyWith(height: 1.50))), SizedBox(height: 22.v), _buildPaymentMethodsGoogle(context, userImage: ImageConstant.imgFrameLightBlue600, googlePay: "lbl_paypal".tr), SizedBox(height: 28.v), _buildPaymentMethodsGoogle(context, userImage: ImageConstant.imgFrame, googlePay: "lbl_google_pay".tr), SizedBox(height: 28.v), _buildPaymentMethodsGoogle(context, userImage: ImageConstant.imgFrameWhiteA70032x32, googlePay: "lbl_apple_pay".tr), SizedBox(height: 28.v), _buildPaymentMethodsDebitCredit(context), Spacer(), Align(alignment: Alignment.center, child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("lbl_paid_479_5".tr, style: CustomTextStyles.bodyLarge18), Padding(padding: EdgeInsets.only(left: 16.h), child: Text("lbl_refund_383_8".tr, style: theme.textTheme.titleMedium))]))])), bottomNavigationBar: _buildConfirmCancellation(context))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(leadingWidth: 52.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgArrowLeft, margin: EdgeInsets.only(left: 24.h, top: 11.v, bottom: 16.v), onTap: () {onTapArrowLeft(context);}), title: AppbarTitle(text: "msg_cancel_hotel_booking".tr, margin: EdgeInsets.only(left: 16.h))); } 
/// Section Widget
Widget _buildPaymentMethodsDebitCredit(BuildContext context) { return Container(width: 380.h, padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 26.v), decoration: AppDecoration.outlineBlack9000c.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16), child: BlocSelector<RefundMethodBloc, RefundMethodState, String?>(selector: (state) => state.radioGroup, builder: (context, radioGroup) {return Padding(padding: EdgeInsets.only(right: 8.h), child: CustomRadioButton(width: 324.h, text: "msg".tr, value: "msg".tr ?? "", groupValue: radioGroup, padding: EdgeInsets.fromLTRB(12.h, 1.v, 30.h, 1.v), isRightCheck: true, onChange: (value) {context.read<RefundMethodBloc>().add(ChangeRadioButtonEvent(value: value));}));})); } 
/// Section Widget
Widget _buildConfirmCancellation(BuildContext context) { return CustomElevatedButton(text: "msg_confirm_cancellation".tr, margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 48.v)); } 
/// Common widget
Widget _buildPaymentMethodsGoogle(BuildContext context, {required String userImage, required String googlePay, }) { return Container(padding: EdgeInsets.all(24.h), decoration: AppDecoration.outlineBlack9000c.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16), child: Row(children: [CustomImageView(imagePath: userImage, height: 32.adaptSize, width: 32.adaptSize), Padding(padding: EdgeInsets.only(left: 12.h, top: 7.v, bottom: 2.v), child: Text(googlePay, style: theme.textTheme.titleMedium!.copyWith(color: appTheme.whiteA700))), Spacer(), CustomImageView(imagePath: ImageConstant.imgContrast, height: 20.adaptSize, width: 20.adaptSize, margin: EdgeInsets.only(top: 6.v, right: 8.h, bottom: 6.v))])); } 

/// Navigates to the previous screen.
onTapArrowLeft(BuildContext context) { NavigatorService.goBack(); } 
 }
