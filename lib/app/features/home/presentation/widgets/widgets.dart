import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather_forecast/l10n/l10n.dart';
import 'package:weather_forecast/app/core/utils/utils.dart';
import 'package:weather_forecast/app/features/home/domain/entities/entities.dart';
import 'package:weather_forecast/app/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:weather_forecast/app/features/home/presentation/cubit/search_bar_cubit/search_bar_cubit.dart';

part 'places_list.dart';
part 'weather_place.dart';
part 'current_weather.dart';
part 'anim_search_bar.dart';
part 'daily_weather_list.dart';
part 'start_search_location.dart';
