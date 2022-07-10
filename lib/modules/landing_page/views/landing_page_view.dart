import 'package:cred_task/generated/assets.dart';
import 'package:cred_task/modules/landing_page/providers/landing_page_provider.dart';
import 'package:cred_task/modules/landing_page/widgets/amount_selection_slider_card.dart';
import 'package:cred_task/modules/landing_page/widgets/bank_selection_card.dart';
import 'package:cred_task/modules/landing_page/widgets/emi_selection_card.dart';
import 'package:cred_task/style/app_colors.dart';
import 'package:cred_task/style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class LandingPageView extends ConsumerWidget {
  const LandingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //injecting LandingPageProvider into LandingPageView
    //observing change and state notifiers
    var landingPageChangeNotifierProvider = ref.watch(landingPageChangeNotifier);
    var state = ref.watch(landingPageStateNotifier);
    return state.when(
      data: (){
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: !landingPageChangeNotifierProvider.zoneOneExtended?
              Text('Cred Task',style: AppTextStyles.s12(fontType: FontType.MEDIUM),):
              const Text(''),
              leading: landingPageChangeNotifierProvider.zoneOneExtended?
              IconButton(
                icon: Icon(Icons.cancel_rounded,color: AppColor.appIceGrey,size: 18.sp,),
                onPressed: (){
                  //changing toggle states for all the zones to exit from the card stack view
                  landingPageChangeNotifierProvider.toggleZoneExtension(1,false);
                  landingPageChangeNotifierProvider.toggleZoneExtension(2,false);
                  landingPageChangeNotifierProvider.toggleZoneExtension(3,false);
                  landingPageChangeNotifierProvider.updateCurrentCardIndex(0);
                },
              ):Container(),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  fit: StackFit.loose,
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    const AmountSelectionSliderCard(),
                    const EMISelectionCard(),
                    const BankSelectionCard(),
                    InkWell(
                      onTap: (){
                        //using toggleZoneExtension to change the state of the zone
                        //using toggleZoneSuspension to change the state of the zone

                        //using currentCardIndex to change the state of the card
                        if(landingPageChangeNotifierProvider.currentCardIndex == 0){
                          landingPageChangeNotifierProvider.toggleZoneExtension(1,true);
                          landingPageChangeNotifierProvider.updateCurrentCardIndex(1);
                          return;
                        }

                        if(landingPageChangeNotifierProvider.currentCardIndex == 1){
                          landingPageChangeNotifierProvider.toggleZoneExtension(2,true);
                          landingPageChangeNotifierProvider.toggleZoneSuspension(1,true);
                          landingPageChangeNotifierProvider.updateCurrentCardIndex(2);
                          return;
                        }

                        if(landingPageChangeNotifierProvider.currentCardIndex == 2){
                          landingPageChangeNotifierProvider.toggleZoneExtension(3,true);
                          landingPageChangeNotifierProvider.toggleZoneSuspension(2,true);
                          landingPageChangeNotifierProvider.updateCurrentCardIndex(3);
                          return;
                        }

                        if(landingPageChangeNotifierProvider.currentCardIndex == 3){
                          //changing toggle states for all the zones to exit from the card stack view
                          landingPageChangeNotifierProvider.toggleZoneExtension(1,false);
                          landingPageChangeNotifierProvider.toggleZoneExtension(2,false);
                          landingPageChangeNotifierProvider.toggleZoneExtension(3,false);
                          landingPageChangeNotifierProvider.updateCurrentCardIndex(0);
                          showDialog(context: context,
                              builder: (context){
                            return Container(
                              child: Lottie.asset(
                                  Assets.assetsAnimationSuccessMedal
                              ),
                            );
                          });
                          Future.delayed(const Duration(seconds: 3),(){
                            landingPageChangeNotifierProvider.resetData();
                            Navigator.pop(context);
                          });
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.appPrimary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.sp),
                            topRight: Radius.circular(10.sp),
                          ),
                        ),
                        child: Center(
                            child: Text(landingPageChangeNotifierProvider.changeCTAItems(),
                                style: AppTextStyles.s14(
                                    fontType: FontType.MEDIUM,
                                    color: AppColor.appWhite
                                )
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
        loading: (){
        return const SafeArea(
          child: Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: AppColor.appPrimary,),
            ),
          ),
        );
        },
        error: (String? error) {
          return Container();
        }, initial: () {
        return Container();
    }
    );
  }
}
