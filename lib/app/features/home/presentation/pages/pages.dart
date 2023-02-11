import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_forecast/app/features/home/domain/entities/entities.dart';

import 'package:weather_forecast/injection_container.dart';
import 'package:weather_forecast/app/features/home/domain/usecases/use_cases.dart';
import 'package:weather_forecast/app/features/home/presentation/widgets/widgets.dart';
import 'package:weather_forecast/app/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:weather_forecast/app/core/presentation/global_widgets.dart/global_widgets.dart';
import 'package:weather_forecast/app/features/home/presentation/cubit/search_bar_cubit/search_bar_cubit.dart';

part 'home_page.dart';
