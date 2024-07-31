import 'package:api_tranning/blocs/main_bloc.dart';
import 'package:api_tranning/components/super_heroes_colors.dart';
import 'package:api_tranning/components/super_heroes_images.dart';
import 'package:api_tranning/pages/superhero_page.dart';
import 'package:api_tranning/widgets/action_button.dart';
import 'package:api_tranning/widgets/info_with_button.dart';
import 'package:api_tranning/widgets/superhero_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainBloc bloc = MainBloc();

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: bloc,
      child: const Scaffold(
        backgroundColor: SuperHeroesColors.background,
        body: SafeArea(
          child: MainPageContent(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}

class MainPageContent extends StatelessWidget {
  const MainPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = Provider.of<MainBloc>(context, listen: false);
    return Stack(
      children: [
        const MainPageStateWidget(),
        Align(
          alignment: Alignment.bottomCenter,
          child: ActionButton(
            onTap: () => bloc.nextState(),
            text: "Next state",
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(right: 16, left: 16, top: 12),
            child: SearchField()),
      ],
    );
  }
}

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      final MainBloc bloc = Provider.of<MainBloc>(context, listen: false);

      controller.addListener(() => bloc.updateText(controller.text));
    });

  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: Colors.white,
      ),
      decoration: InputDecoration(
          isDense: true,
          fillColor: SuperHeroesColors.indigo75,
          prefixIcon: const Icon(Icons.search, color: Colors.white54, size: 24),
          suffix: GestureDetector(
            onTap: () => controller.clear(),
            child: Icon(
              Icons.clear,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white24),
          )),
    );
  }
}

class FavoritesWidget extends StatelessWidget {
  const FavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 90),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Your favorites",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SuperheroCard(
            name: "Batman",
            realName: "Bruce Wayne",
            imageUrl:
            'https://www.superherodb.com/pictures2/portraits/10/100/639.jpg',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SuperheroPage(name: "Batman"),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SuperheroCard(
            name: 'Ironman',
            realName: 'Tony Stark',
            imageUrl:
            'https://www.superherodb.com/pictures2/portraits/10/100/85.jpg',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SuperheroPage(name: "Iranman"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 90),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Search Results",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SuperheroCard(
            name: "Venom",
            realName: "Eddie Brock",
            imageUrl:
            'https://www.superherodb.com/pictures2/portraits/10/100/22.jpg',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SuperheroPage(name: "Venom"),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SuperheroCard(
            name: 'Ironman',
            realName: 'Tony Stark',
            imageUrl:
            'https://www.superherodb.com/pictures2/portraits/10/100/85.jpg',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SuperheroPage(name: "Ironman"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class NoFavoritesWidget extends StatelessWidget {
  const NoFavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: InfoWithButton(
        title: "No favorites yet",
        subtitle: "Search and add",
        buttonText: "Search",
        assetImagine: SuperHeroesImages.ironman,
        imageHeight: 119,
        imageWidth: 108,
        imageTopPadding: 9,
      ),
    );
  }
}

class NothingFound extends StatelessWidget {
  const NothingFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: InfoWithButton(
        title: "Nothing found",
        subtitle: "Search For Something Else",
        buttonText: "Search",
        assetImagine: SuperHeroesImages.hulk,
        imageHeight: 119,
        imageWidth: 108,
        imageTopPadding: 9,
      ),
    );
  }
}

class LoadingError extends StatelessWidget {
  const LoadingError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: InfoWithButton(
        title: "Error happend",
        subtitle: "Please, try again",
        buttonText: "Retry",
        assetImagine: SuperHeroesImages.superMan,
        imageHeight: 119,
        imageWidth: 108,
        imageTopPadding: 9,
      ),
    );
  }
}

class MinSymbolsWidget extends StatelessWidget {
  const MinSymbolsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 110),
        child: Text(
          "Enter at least 3 symbols",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 110),
        child: CircularProgressIndicator(
            color: SuperHeroesColors.blue, strokeWidth: 4),
      ),
    );
  }
}

class MainPageStateWidget extends StatelessWidget {
  const MainPageStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = Provider.of<MainBloc>(context, listen: false);
    return StreamBuilder<MainPageState>(
      stream: bloc.observeMainPageState(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return const SizedBox();
        }
        final MainPageState state = snapshot.data!;
        switch (state) {
          case MainPageState.loading:
            return const LoadingIndicator();
          case MainPageState.noFavorites:
            return const NoFavoritesWidget();
          case MainPageState.minSymbols:
            return const MinSymbolsWidget();
          case MainPageState.favorites:
            return const FavoritesWidget();
          case MainPageState.searchResults:
            return const SearchResultsWidget();
          case MainPageState.nothingFound:
            return const NothingFound();
          case MainPageState.loadingError:
            return const LoadingError();
          default:
            return Center(
              child: Text(
                state.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            );
        }
      },
    );
  }
}
