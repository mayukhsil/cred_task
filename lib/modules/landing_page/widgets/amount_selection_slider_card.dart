import 'package:cred_task/modules/landing_page/providers/landing_page_provider.dart';
import 'package:cred_task/style/app_colors.dart';
import 'package:cred_task/style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class AmountSelectionSliderCard extends ConsumerWidget {
  const AmountSelectionSliderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //injecting LandingPageProvider
    var landingPageChangeNotifierProvider = ref.watch(landingPageChangeNotifier);
    return  AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: landingPageChangeNotifierProvider.zoneOneExtended ?
      landingPageChangeNotifierProvider.zoneOneSuspended ? 600.h: 550.h : 0.h,
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 1.4,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColor.appGreyShade2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: landingPageChangeNotifierProvider.zoneOneSuspended ?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(child: Text('Credit Amount',
                        style: AppTextStyles.s12(fontType: FontType.SEMI_BOLD,color: AppColor.appIceGrey.withOpacity(0.5)),
                      )),
                      Flexible(child: Text('\u20b9 ${landingPageChangeNotifierProvider.selectedAmount.round()}',
                        style: AppTextStyles.s16(fontType: FontType.MEDIUM,color: AppColor.appIceGrey.withOpacity(0.5)),
                      )),
                    ],
                  ),
                  InkWell(
                      onTap: (){
                        //toggle the suspension and expanded of the cards below
                        landingPageChangeNotifierProvider.toggleZoneExtension(3,false);
                        landingPageChangeNotifierProvider.toggleZoneExtension(2,false);
                        landingPageChangeNotifierProvider.toggleZoneSuspension(2,false);
                        landingPageChangeNotifierProvider.toggleZoneSuspension(1,false);
                        landingPageChangeNotifierProvider.updateCurrentCardIndex(1);
                      },
                      child: Icon(Icons.arrow_drop_down_rounded,color: AppColor.appIceGrey.withOpacity(0.5),size: 40.sp,)),
                ],
              ):
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: Text('hi adarsh, how much money do you need?',
                    style: AppTextStyles.s16(fontType: FontType.MEDIUM,color: AppColor.appIceGrey),
                  )),
                  Flexible(child: Text('move the dial upto \u20b9 150,000',
                    style: AppTextStyles.s12(fontType: FontType.MEDIUM,color: AppColor.appIceGrey),
                  )),
                  Flexible(child: SizedBox(height: 20.h,)),
                  Visibility(
                    visible: landingPageChangeNotifierProvider.zoneOneExtended,
                    child: Flexible(
                      flex: 4,
                      child: Center(
                        child: Container(
                          height: 300.h,
                          width: 280.w,
                          decoration: BoxDecoration(
                            color: AppColor.appWhite,
                            borderRadius: BorderRadius.circular(15.sp),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.sp),
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 10,
                                  child: SleekCircularSlider(
                                    initialValue: landingPageChangeNotifierProvider.selectedAmount,
                                    min: 0,
                                    max: 150000,
                                    appearance: CircularSliderAppearance(
                                      customColors: CustomSliderColors(
                                        progressBarColor: AppColor.appPrimary,
                                        shadowColor: AppColor.appIceGrey,
                                        trackColor: AppColor.appIceGrey,
                                      ),
                                      size: 300.sp,
                                      infoProperties: InfoProperties(
                                        mainLabelStyle: AppTextStyles.s18(fontType: FontType.REGULAR
                                            ,color: AppColor.appDarkGrey),
                                        modifier: (value){
                                          return '\u20b9 ${value.round()}';
                                        },
                                      )
                                    ),
                                    onChange: (value){
                                      landingPageChangeNotifierProvider.updateAmount(value);
                                    },
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Text('Please select your EMI amount',
                                    style: AppTextStyles.s12(fontType: FontType.REGULAR,color: AppColor.appDarkGrey),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}
