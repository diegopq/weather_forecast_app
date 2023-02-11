part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
            searchPlaces: getIt<SearchPlaces>(),
            getWeather: getIt<GetWeather>(),
          ),
        ),
        BlocProvider(
          create: (context) => SearchBarCubit(),
        ),
      ],
      child: const _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatelessWidget {
  const _HomePageContent();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF1A1D1E),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Padding(
          padding: EdgeInsets.only(
            top: mq.viewPadding.top,
            // bottom: mq.viewInsets.bottom ,
          ),
          child: Column(
            children: [
              const AnimSearchBar(),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (_, state) {
                  if (state is HomeInitial) {
                    return const StartSearchLocation();
                  }
                  if (state is SearchingState) {
                    return state.isBusy
                        ? Expanded(
                            child: Loader(
                              size: 150.r,
                            ),
                          )
                        : Expanded(
                            child: PlacesList(
                              places: state.places,
                            ),
                          );
                  }
                  if (state is PlaceWeather) {
                    return state.isBusy
                        ? Expanded(
                            child: Loader(
                              size: 150.r,
                            ),
                          )
                        : Expanded(
                            child: WeatherPlace(
                              place: state.place,
                              weather: state.weather,
                            ),
                          );
                  }
                  return Container();
                },
              ),
              // Expanded(
              //   child: Container(
              //     color: Colors.red,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
