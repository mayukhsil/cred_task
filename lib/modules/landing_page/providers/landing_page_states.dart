import 'package:freezed_annotation/freezed_annotation.dart';

part 'landing_page_states.freezed.dart';

///Extension Method for easy comparison
extension LandingPageStates on LandingPageState {
  bool get isLoading => this is _LandingPageStateLoading;
}

@freezed
abstract class LandingPageState with _$LandingPageState {
  ///Initial
  const factory LandingPageState.initial() = _LandingPageStateInitial;

  ///Loading
  const factory LandingPageState.loading() = _LandingPageStateLoading;

  ///Data
  const factory LandingPageState.data() = _LandingPageStateData;

  ///Error
  const factory LandingPageState.error([String? error]) = _LandingPageStateError;
}