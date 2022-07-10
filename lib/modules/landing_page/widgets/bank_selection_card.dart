import 'package:cred_task/modules/landing_page/providers/landing_page_provider.dart';
import 'package:cred_task/style/app_colors.dart';
import 'package:cred_task/style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BankSelectionCard extends ConsumerWidget {
  const BankSelectionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var landingPageChangeNotifierProvider = ref.watch(landingPageChangeNotifier);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: landingPageChangeNotifierProvider.zoneThreeExtended ?
      landingPageChangeNotifierProvider.zoneThreeSuspended ? 400.h: 450.h : 0.h,
      child: Container(
        height: MediaQuery.of(context).size.height / 1.4,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColor.appGreyShade1,
        ),
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: landingPageChangeNotifierProvider.zoneThreeSuspended ?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: Text('Selected bank',
                    style: AppTextStyles.s12(fontType: FontType.MEDIUM,color: AppColor.appDarkGrey),
                  )),
                  Flexible(child: Text(landingPageChangeNotifierProvider.selectedBank,
                    style: AppTextStyles.s16(fontType: FontType.MEDIUM,color: AppColor.appDarkGrey),
                  )),
                ],
              ),
              Column(
                children: [
                  Flexible(
                      child: InkWell(
                          onTap: (){
                            landingPageChangeNotifierProvider.toggleZoneExtension(3,false);
                            landingPageChangeNotifierProvider.toggleZoneSuspension(2,false);
                            landingPageChangeNotifierProvider.updateCurrentCardIndex(2);
                          },
                          child: Icon(Icons.arrow_drop_down_circle,color: AppColor.appDarkGrey,size: 40.sp,))),
                ],
              ),
            ],
          ):
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(child: Text('where should we send the money?',
                style: AppTextStyles.s16(fontType: FontType.MEDIUM),)),
              Flexible(child: Text('amount will be credit to this bank account,EMI will also be \n'
                  'debited from the account',
                style: AppTextStyles.s12(fontType: FontType.REGULAR,color: AppColor.appIceGrey),)),
              Flexible(child: SizedBox(height: 20.h,)),
              Flexible(
                flex: 8,
                child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 8,
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 4,
                                      child: Container(
                                    height: 30.h,
                                    width: 30.h,
                                    decoration: BoxDecoration(
                                      color: AppColor.appGreyShade2,
                                      borderRadius: BorderRadius.circular(5.h),
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                          height: 20.h,
                                          width: 20.w,
                                          child: Image.asset(landingPageChangeNotifierProvider.bankLogos[index])),
                                    ),
                                  )),
                                  SizedBox(width: 10.w,),
                                  Flexible(
                                    flex: 8,
                                    child: RichText(text: TextSpan(
                                      text: '${landingPageChangeNotifierProvider.bankLists[index]} \n',
                                      style: AppTextStyles.s14(fontType: FontType.MEDIUM,color: AppColor.appIceGrey),
                                      children: [
                                        TextSpan(
                                          text: landingPageChangeNotifierProvider.bankAccountNumbers[index],
                                          style: AppTextStyles.s12(
                                              fontType: FontType.REGULAR
                                              ,color: AppColor.appIceGrey
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 8,
                              child: GestureDetector(
                                onTap: (){
                                  landingPageChangeNotifierProvider.updateBankCardIndex(index);
                                  landingPageChangeNotifierProvider.updateSelectedBank(landingPageChangeNotifierProvider.bankLists[index]);
                                },
                                child: Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: const BoxDecoration(
                                    color: AppColor.appGreyShade2,
                                    shape: BoxShape.circle,
                                  ),
                                  child: landingPageChangeNotifierProvider.selectedBankCardIndex == index ?
                                  Icon(Icons.check_rounded,color: AppColor.appIceGrey,size: 20.w,)
                                      :Container(),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
