part of 'widgets.dart';

class DailyWeatherList extends StatelessWidget {
  const DailyWeatherList({
    required this.dailyWeather,
    super.key,
  });

  final List<DayWeather> dailyWeather;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return ListView.builder(
      itemCount: 7, //dailyWeather.length,
      padding: EdgeInsets.only(
        top: 5.h,
        bottom: mq.viewPadding.bottom,
      ),
      itemBuilder: (_, index) {
        final dayWeather = dailyWeather[index];
        return _DayWeatherItem(
          dayWeather: dayWeather,
        );
      },
    );
  }
}

class _DayWeatherItem extends StatelessWidget {
  const _DayWeatherItem({
    required this.dayWeather,
  });

  final DayWeather dayWeather;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: 10.h,
      ),
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
        top: 5.h,
        bottom: 5.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2329),
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      ),
      height: 80.h,
      child: Row(
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: FittedBox(
                    child: Text(
                      _getDay(context, dayWeather.date),
                      style: theme.textTheme.headlineSmall!.copyWith(
                        color: Colors.white,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
                Text(
                  DateFormat('dd/MM/yy').format(dayWeather.date),
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: Colors.white.withOpacity(0.6),
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 40.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Min.',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.white.withOpacity(
                      0.8,
                    ),
                  ),
                ),
                Text(
                  '${dayWeather.minTemp.toStringAsFixed(1)}º',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            // flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Max.',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.white.withOpacity(
                      0.8,
                    ),
                  ),
                ),
                Text(
                  '${dayWeather.maxTemp.toStringAsFixed(1)}º',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 30.w,
          ),
          Lottie.asset(
            getWeatherAnimation(dayWeather.weatherCode),
            height: 50.h,
          )
        ],
      ),
    );
  }

  String _getDay(BuildContext context, DateTime date) {
    final l10n = context.l10n;
    final currentDay = DateTime.now();
    // print(day);

    if (currentDay.day == date.day && currentDay.weekday == date.weekday) {
      return l10n.today;
    }

    switch (date.weekday) {
      case 1:
        return l10n.monday;
      case 2:
        return l10n.tuesday;
      case 3:
        return l10n.wednesday;
      case 4:
        return l10n.thursday;
      case 5:
        return l10n.friday;
      case 6:
        return l10n.saturday;
      case 7:
        return l10n.sunday;
    }

    return '';
  }
}
