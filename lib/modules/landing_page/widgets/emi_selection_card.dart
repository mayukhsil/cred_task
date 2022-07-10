import 'package:cred_task/modules/landing_page/providers/landing_page_provider.dart';
import 'package:cred_task/style/app_colors.dart';
import 'package:cred_task/style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EMISelectionCard extends ConsumerWidget {
  const EMISelectionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //injecting LandingPageProvider
    var landingPageChangeNotifierProvider = ref.watch(landingPageChangeNotifier);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: landingPageChangeNotifierProvider.zoneTwoExtended ?
      landingPageChangeNotifierProvider.zoneTwoSuspended ? 520.h: 500.h : 0.h,
      child: Container(
        height: MediaQuery.of(context).size.height / 1.4,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColor.appDarkGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: landingPageChangeNotifierProvider.zoneTwoSuspended ?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: Text('Selected EMI tenure',
                    style: AppTextStyles.s12(
                        fontType: FontType.MEDIUM,
                        color: AppColor.appIceGrey.withOpacity(0.5)
                    ),
                  )),
                  Flexible(child: Text('${landingPageChangeNotifierProvider.selectedTenurePeriod}'
                      ' months @ \u20b9 ${landingPageChangeNotifierProvider.selectedTenureMonthlyAmount} p/m',
                    style: AppTextStyles.s16(
                        fontType: FontType.MEDIUM,
                        color: AppColor.appIceGrey.withOpacity(0.5)
                    ),
                  )),
                ],
              ),
              InkWell(
                  onTap: (){
                    landingPageChangeNotifierProvider.toggleZoneExtension(3,false);
                    landingPageChangeNotifierProvider.toggleZoneSuspension(2,false);
                    landingPageChangeNotifierProvider.updateCurrentCardIndex(2);
                  },
                  child: Icon(Icons.arrow_drop_down_rounded,color: AppColor.appIceGrey.withOpacity(0.5),size: 40.sp,)),
            ],
          ):
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(child: Text('how do you wish to repay?',
                style: AppTextStyles.s16(fontType: FontType.MEDIUM),)),
              Flexible(child: Text('choose one of our recommended EMI plans',
                style: AppTextStyles.s12(fontType: FontType.MEDIUM,color: AppColor.appGrey),)),
              Flexible(child: SizedBox(height: 20.h,)),
              Flexible(
                flex: 2,
                  child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: GestureDetector(
                        onTap: (){
                          landingPageChangeNotifierProvider.updateEMICardIndex(index);
                          landingPageChangeNotifierProvider
                              .updateTenurePeriod(
                              landingPageChangeNotifierProvider
                                  .tenurePeriods[index]
                          );
                          landingPageChangeNotifierProvider.updateEMIMonthlyAmountValue(
                              landingPageChangeNotifierProvider.calculateEMIAmount(
                              landingPageChangeNotifierProvider.tenurePeriods[index]));
                        },
                        child: Container(
                          height: 120.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            color: AppColor().emiCardColors[index],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Container(
                                    height: 35.h,
                                    width: 35.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColor.appWhite,
                                        width: 0.5.w,
                                      ),
                                    ),
                                    child: landingPageChangeNotifierProvider.currentEMICardIndex == index?
                                    Icon(Icons.check,color: AppColor.appIceGrey,size: 20.sp,):Container(),
                                  ),
                                ),
                                Flexible(child: SizedBox(height: 10.h,)),
                                Flexible(
                                  child: Text('\u20b9 ${landingPageChangeNotifierProvider.calculateEMIAmount(
                                      landingPageChangeNotifierProvider.tenurePeriods[index])} m/o',
                                    style: AppTextStyles.s16(fontType: FontType.MEDIUM,color: AppColor.appWhite),),
                                ),
                                Flexible(
                                  child: Text('for ${landingPageChangeNotifierProvider.tenurePeriods[index]} months',
                                    style: AppTextStyles.s12(fontType: FontType.MEDIUM,color: AppColor.appWhite),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
