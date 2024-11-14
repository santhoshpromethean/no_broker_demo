import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_broker_demo/shared/extension.dart';

import '../core/model/land_details.dart';
import '../service/api.dart';
import 'base.dart';

class LandListNotifier extends ResourceNotifier<List<LandDetails>> {
  LandListNotifier() : super();

  @override
  Future<void> loadLandDetails() async {
    try {
      final lands = await ServiceAPI.lands.getLands().withRetry(retries: 2);
      value = lands as List<LandDetails>?;
      print('Data loaded successfully: $lands');
    } catch (e) {
      print('Error loading data: $e');
    }
  }
}

final landProvider = ChangeNotifierProvider<LandListNotifier>((ref) {
  return LandListNotifier();
});
