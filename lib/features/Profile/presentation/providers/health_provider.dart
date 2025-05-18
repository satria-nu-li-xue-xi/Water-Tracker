import 'package:flutter/material.dart';
import 'package:project_onepercent/features/Profile/data/models/daily_data.dart';
import 'package:project_onepercent/features/Profile/data/models/user_profile.dart';

class HealthProvider extends ChangeNotifier{
  UserProfile _userProfile = UserProfile(
    weight: 70, 
    waterGoal: 3.0, 
    stepGoal: 10000, 
    sleepGoal: 8, 
    age: 30,
  );

  final DailyData _todayData = DailyData(
    waterConsumed: 0, 
    steps: 0, 
    caloriesBurned: 0, 
    sleepHours: 0, 
    heartRate: 0, 
    date: DateTime.now(),
  );

  UserProfile get userProfile => _userProfile;
  DailyData get todayData => _todayData;

//update profile
  void updateProfile(UserProfile newProfile){
    _userProfile = newProfile;
    _calculateAdaptiveWaterGoal();
    notifyListeners();
  }

//calculate water need (adaptive)
  void _calculateAdaptiveWaterGoal(){
    //base formula: 35ml water/kg weight
    double baseWater = _userProfile.weight * 0.035;

    //adjust according to activities
    double activityAdjustment = _todayData.caloriesBurned / 1000;
    double stepAdjustment = _todayData.steps / 5000;
    double sleepAdjustment = (8 - _todayData.sleepHours).clamp(0, 3) * 0.1;

    _userProfile.waterGoal = (baseWater + activityAdjustment + stepAdjustment + sleepAdjustment).clamp(1.5, 5.0);
  }

  //update daily data from sensors/input
  void updateDailyData({
    double? water,
    int? steps,
    double? calories,
    double? sleep,
    int? heartRate,
  }) {
    if (water != null) _todayData.waterConsumed = water;
    if (steps != null) _todayData.steps = steps;
    if (calories != null) _todayData.caloriesBurned = calories;
    if (sleep != null) _todayData.sleepHours = sleep;
    if (heartRate != null) _todayData.heartRate + heartRate;

    _calculateAdaptiveWaterGoal();
    notifyListeners();
  }
}