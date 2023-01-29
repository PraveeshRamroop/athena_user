import 'package:get_it/get_it.dart';
import 'package:athena_user/services/call_sms.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(CallsAndMessagesService());
}
