import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:weather_forecast/app/core/presentation/global_widgets.dart/global_widgets.dart';
import 'package:weather_forecast/app/core/routes/router.dart';
import 'package:weather_forecast/app/core/theme/theme.dart';
import 'package:weather_forecast/app/core/utils/utils.dart';
import 'package:weather_forecast/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    this.flavor = Flavor.production,
  });

  final Flavor flavor;

  @override
  Widget build(BuildContext context) {
    return _App(flavor: flavor);
  }
}

class _App extends StatelessWidget {
  const _App({
    required this.flavor,
  });

  final Flavor flavor;

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    final appRouter = AppRouter(
      context,
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
    );
    return FlavorBanner(
      flavor: flavor,
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: appRouter.router,
            debugShowCheckedModeBanner: false,
            theme: LighTheme.data,
            localizationsDelegates: const [
              ...AppLocalizations.localizationsDelegates,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            title: 'Weather Forecast',
            builder: (ctx, widget) {
              ScreenUtil.init(
                ctx,
                minTextAdapt: true,
                designSize: const Size(390, 844),
              );
              widget = botToastBuilder(ctx, widget);
              return ResponsiveWrapper.builder(
                kIsWeb
                    ? ClampingScrollWrapper.builder(context, widget)
                    : Platform.isIOS
                        ? BouncingScrollWrapper.builder(ctx, widget)
                        : ClampingScrollWrapper.builder(context, widget),
                breakpoints: const [
                  ResponsiveBreakpoint.autoScale(
                    320,
                    name: 'SMOBILE',
                    scaleFactor: 0.88,
                  ),
                  ResponsiveBreakpoint.autoScale(
                    380,
                    name: 'SAMOBILE',
                    scaleFactor: 0.98,
                  ),
                  ResponsiveBreakpoint.resize(
                    400,
                    name: MOBILE,
                  )
                ],
                mediaQueryData: MediaQuery.of(ctx).copyWith(
                  textScaleFactor: 1,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
