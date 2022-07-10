import 'dart:math';

import 'package:cred_task/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cred_task/modules/landing_page/providers/landing_page_states.dart';

part 'landing_page_state_notifier.dart';
part 'landing_page_change_notifier.dart';


var landingPageChangeNotifier = ChangeNotifierProvider((_)
=> LandingPageChangeNotifier());

var landingPageStateNotifier = StateNotifierProvider
<LandingPageStateNotifier, LandingPageState>((_)
=> LandingPageStateNotifier());
