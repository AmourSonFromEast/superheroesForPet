import 'package:api_tranning/blocs/main_bloc.dart';
import 'package:api_tranning/components/super_heroes_colors.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainBloc bloc = MainBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SuperHeroesColors.background,
      body: SafeArea(
        child: MainPageWidget(bloc: bloc),
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}

class MainPageWidget extends StatelessWidget {
  final MainBloc bloc;

  const MainPageWidget({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<MainPageState>(
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
              case MainPageState.minSymbols:
              case MainPageState.nothingFound:
              case MainPageState.loadingError:
              case MainPageState.searchResults:
              case MainPageState.favorites:
              default:
                return Center(
                  child: Text(
                    state.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                );
            }
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () => bloc.nextState(),
            child: const Text(
              "Next state",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        )
      ],
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
          color: SuperHeroesColors.blue,
          strokeWidth: 4
        ),
      ),
    );
  }
}
