import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/config/env.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/mixin/messenger_mixin.dart';
import 'package:gimme_delivery/core/theme/theme.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_primary_button.dart';
import 'package:gimme_delivery/features/main/delivery/domain/entities/pickup_request.dart';
import 'package:gimme_delivery/features/main/delivery/presentation/cubit/pick_up_cubit.dart';
import 'package:gimme_delivery/features/main/delivery/presentation/widget/annotation_click_listener.dart';
import 'package:gimme_delivery/features/main/delivery/presentation/widget/pick_up_bottomsheet.dart';
import 'package:gimme_delivery/router/app_router.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

@RoutePage()
class PickUpPage extends StatefulWidget {
  const PickUpPage({
    super.key,
    required this.pickUpRequest,
    required this.merchants,
  });

  static const String routeName = "/pick-up";

  final List<MerchantModel?> merchants;
  final PickUpRequest pickUpRequest;

  @override
  State<PickUpPage> createState() => _PickUpPageState();
}

class _PickUpPageState extends State<PickUpPage> with MessagerMixin {
  late final CameraOptions _initCameraOptions;
  late final PickUpCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<PickUpCubit>();
    _initCameraOptions = CameraOptions(
        center: Point(
          coordinates: Position(
              widget.pickUpRequest.longitude, widget.pickUpRequest.latitude),
        ).toJson(),
        zoom: 15.0);
    super.initState();
  }

  @override
  void dispose() {
    _cubit.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          _cubit..initialize(widget.merchants, widget.pickUpRequest),
      child: BlocConsumer<PickUpCubit, PickUpState>(
        listener: (context, state) {
          if (state.status == PickUpStateStatus.mapCreated) {
            _cubit.pointAnnotationManager?.addOnPointAnnotationClickListener(
              MerchantClickListener(
                onClickAnnotation: _cubit.setPickUpRequest,
              ),
            );
          }
          if (state.status == PickUpStateStatus.done) {
            getIt<AppRouter>().pop(state.pickUpRequest);
          }
        },
        builder: (context, state) => Scaffold(
          persistentFooterButtons: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              width: double.infinity,
              child: AppPrimaryButton(
                text: 'Next',
                onPressed: () {
                  showAppModalBottomsheet(
                    context: context,
                    title: 'Sender Detail',
                    widget: (_, __) => PickUpBottomsheetWidget(
                      cubit: _cubit,
                    ),
                  );
                },
              ),
            )
          ],
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              MapWidget(
                cameraOptions: _initCameraOptions,
                onMapCreated: _cubit.onMapCreated,
                resourceOptions: ResourceOptions(accessToken: Env.mapBoxToken),
                onScrollListener: (coordinate) {},
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.sp),
                    ),
                    child: IconButton(
                      onPressed: () => getIt<AppRouter>().pop(),
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                  ),
                  Gap(10.h),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Double check suggested\npickup point',
                            style: AppTextStyle.headlineMedium()
                                .copyWith(height: 1.5),
                          ),
                          Gap(20.h),
                          Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 18.h),
                              decoration: BoxDecoration(
                                  color: AppColors.surfaceColor,
                                  borderRadius: BorderRadius.circular(20.sp),
                                  border: Border.all(
                                      color: AppColors.hintTextColor
                                          .withOpacity(0.2))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.pickUpRequest?.locationName ?? '-',
                                    style: AppTextStyle.headlineMedium(),
                                  ),
                                  Gap(4.h),
                                  Text(
                                    state.pickUpRequest?.address ?? '-',
                                    style: AppTextStyle.bodyMedium(
                                            color: AppColors.hintTextColor)
                                        .copyWith(height: 1.2),
                                  ),
                                  Divider(
                                    height: 20.h,
                                    color: AppColors.hintTextColor
                                        .withOpacity(0.2),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Lon: ${state.pickUpRequest?.longitude ?? '-'}',
                                        style: AppTextStyle.bodySmall(
                                            color: AppColors.hintTextColor),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Lat: ${state.pickUpRequest?.latitude ?? '-'}',
                                        style: AppTextStyle.bodySmall(
                                            color: AppColors.hintTextColor),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.pickMarker,
                      width: 50.w,
                      height: 50.h,
                    ),
                    Gap(35.h),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
