part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Home',
              ),
              ElevatedButton(
                onPressed: () {
                  getIt<IPlacesDatasource>().getSearchResults(placeName: 'mon');
                },
                child: Text('Llamar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
