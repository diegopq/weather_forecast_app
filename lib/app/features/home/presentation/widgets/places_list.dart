part of 'widgets.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({
    required this.places,
    super.key,
  });

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return places.isEmpty
        ? Center(
            child: Text(
              'No se encontraron resultados',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
            ),
          )
        : ListView.builder(
            padding: EdgeInsets.only(
              top: 10.h,
            ),
            itemCount: places.length,
            itemBuilder: (_, index) {
              final place = places[index];
              return ListTile(
                title: Text(
                  place.placeName,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
                ),
                dense: true,
                style: ListTileStyle.list,
                subtitle: Text(
                  '${place.cityName}, ${place.state}, ${place.country}',
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                horizontalTitleGap: 2.h,
                onTap: () {
                  context.read<SearchBarCubit>().unFocus();
                  context.read<HomeBloc>().add(SelectPlace(place));
                },
              );
            },
          );
  }
}
