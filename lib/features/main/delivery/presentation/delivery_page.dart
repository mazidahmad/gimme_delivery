import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/theme/theme.dart';
import 'package:gimme_delivery/features/main/delivery/presentation/cubit/delivery_cubit.dart';
import 'package:gimme_delivery/router/app_router.dart';
import 'package:gimme_delivery/router/app_router.gr.dart';
import 'package:location/location.dart';

@RoutePage()
class DeliveryPage extends StatefulWidget {
  const DeliveryPage({required this.currLocation, super.key});

  static const String routeName = "/delivery";

  final LocationData currLocation;

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  late final DeliveryCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<DeliveryCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit..getMerchants(),
      child: Scaffold(
        body: BlocBuilder<DeliveryCubit, DeliveryState>(
          builder: (context, state) {
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => getIt<AppRouter>().pop(),
                              icon: const Icon(
                                Icons.close,
                              ),
                            ),
                            Text(
                              'Where do you want to deliver?',
                              style: AppTextStyle.headlineMedium()
                                  .copyWith(height: 0),
                            )
                          ],
                        ),
                        Gap(10.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 8.h),
                          decoration: BoxDecoration(
                              color: AppColors.surfaceColor,
                              borderRadius: BorderRadius.circular(20.sp),
                              border: Border.all(
                                  color: AppColors.hintTextColor
                                      .withOpacity(0.2))),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.arrow_circle_up_rounded,
                                    color: AppColors.green,
                                    size: 35.sp,
                                  ),
                                  Gap(14.h),
                                  Icon(
                                    Icons.share_location_rounded,
                                    color: AppColors.primaryColor,
                                    size: 35.sp,
                                  ),
                                ],
                              ),
                              Gap(12.w),
                              Expanded(
                                child: Column(
                                  children: [
                                    const AppSecondaryTextField(
                                        hint: "Search for pick point"),
                                    Divider(
                                      height: 1,
                                      color: AppColors.hintTextColor
                                          .withOpacity(0.2),
                                    ),
                                    const AppSecondaryTextField(
                                        hint: "Search for destination point"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Gap(20.h),
                        AppSmallButton(
                          onTap: () => getIt<AppRouter>().push(
                            PickUpRoute(
                              lattitude: widget.currLocation.latitude!,
                              longitude: widget.currLocation.longitude!,
                            ),
                          ),
                        ),
                        Divider(
                          height: 40.h,
                          color: AppColors.hintTextColor.withOpacity(0.2),
                        ),
                        Text(
                          'Nearby',
                          style: AppTextStyle.headlineMedium(),
                        ),
                      ],
                    ),
                  ),
                  Gap(20.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.merchants?.length ?? 0,
                      itemBuilder: (context, index) {
                        var merchant = state.merchants![index]!;
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 14.h),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.place_rounded,
                                    color: AppColors.primaryColor,
                                  ),
                                  Gap(12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          merchant.merchant_name,
                                          style: AppTextStyle.headlineSmall(),
                                        ),
                                        Gap(4.h),
                                        Text(
                                          merchant.address,
                                          style: AppTextStyle.bodySmall(
                                            color: AppColors.hintTextColor,
                                          ).copyWith(height: 1.2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider()
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class AppSmallButton extends StatelessWidget {
  const AppSmallButton({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(
            color: AppColors.hintTextColor.withOpacity(0.2),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.map_rounded,
              color: AppColors.primaryColor,
              size: 20.sp,
            ),
            Gap(5.w),
            Text(
              'Select via map',
              style: AppTextStyle.bodySmall().copyWith(height: 0),
            )
          ],
        ),
      ),
    );
  }
}

class AppSecondaryTextField extends StatelessWidget {
  const AppSecondaryTextField({
    this.hint = '',
    this.controller,
    super.key,
  });

  final TextEditingController? controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppTextStyle.bodyMedium(color: AppColors.textColor)
          .copyWith(height: 1),
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(),
        prefixIconColor: AppColors.hintTextColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: AppTextStyle.bodyMedium(color: AppColors.hintTextColor)
            .copyWith(height: 1),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
