part of 'landing_page_provider.dart';


class LandingPageStateNotifier extends StateNotifier<LandingPageState> {
  LandingPageStateNotifier()   :
        super(const LandingPageState.initial()){
    state = const LandingPageState.data();
  }
}