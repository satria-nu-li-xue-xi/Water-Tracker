import 'package:health/health.dart';
import 'package:pedometer/pedometer.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HealthService {
  final HealthFactory health = HealthFactory();

  Future<void> initHealthData(HealthProvider provider) async {
    //request permission
    final types = [
      HealthDataType.STEPS,
      HealthDataType.ACTIVE_ENERGY_BURNED,
      HealthDataType.WATER,
      HealthDataType.SLEEP_IN_BED,
      HealthDataType.HEART_RATE,
    ];

    final permissions = types.map((e) => HealthDataAccess.READ_WRITE).toList();

    bool granted = await health.requestAuthorization(types, permissions: permissions);

    if (granted) {
      //get today's data
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      //gets steps data
      final steps = await health.getTotalStepsInInterval(today, now);

      //gets calori data
      final calories = await health.getTotalEnergyBurned(today, now);

      //gets sleep data
      final sleep = await health.getSleepInBed(today, now);

      //gets water data
      final water = await health.getWater(today, now);

      //gets heartrate data
      final heartRate = await health.getLatestHeartRate();

      //update provider
      provider.updateDailyData(
        steps: steps ?? 0,
        calories: calories ?? 0,
        sleep: sleep?.inHours.toDouble() ?? 0,
        water: water ?? 0,
        heartRate: heartRate?.value.round() ?? 72,
      );
    }

    //setup stream for pedometer (steps)
    Pedometer.stepCountStream.listen((StepCount event) {
      provider.updateDailyData(steps: event.steps);
    });

    //setup stream for pedometer (activities)
    accelerometerEventStream.listen((AccelerometerEvent event) {
      //detection logic
    });
  }
}