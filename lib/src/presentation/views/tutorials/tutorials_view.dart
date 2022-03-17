import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import 'package:tutorial/src/core/bloc/bloc_with_state.dart';
import 'package:tutorial/src/domain/entities/tutorial/tutorial.dart';
import 'package:tutorial/src/presentation/blocs/remote_tutorials/remote_tutorials_bloc.dart';
import 'package:tutorial/src/presentation/widgets/tutorial_widget.dart';

class TutorialsView extends HookWidget {
  const TutorialsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    useEffect(() {
      scrollController
          .addListener(() => _onScrollListener(context, scrollController));
      // return scrollController.dispose;
      return;
    }, [scrollController]);

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(scrollController),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Daily News', style: TextStyle(color: Colors.black)),
      actions: [
        Builder(
          builder: (context) => GestureDetector(
            onTap: () => _onShowSavedTutorialsViewTapped(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Ionicons.bookmark, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(ScrollController scrollController) {
    return BlocBuilder<RemoteTutorialsBloc, RemoteTutorialsState>(
      builder: (_, state) {
        if (state is RemoteTutorialsLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteTutorialsError) {
          return const Center(child: Icon(Ionicons.refresh));
        }
        if (state is RemoteTutorialsDone) {
          // print('_buildBody : ' + state.tutorials!.length.toString());
          return _buildTutorial(
              scrollController, state.tutorials!, state.noMoreData!);
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildTutorial(
    ScrollController scrollController,
    List<Tutorial> tutorials,
    bool noMoreData,
  ) {
    return ListView(
      controller: scrollController,
      children: [
        // Items
        ...List<Widget>.from(
          tutorials.map(
            (e) => Builder(
              builder: (context) => TutorialWidget(
                tutorial: e,
                onTutorialPressed: (e) => _onTutorialPressed(context, e),
              ),
            ),
          ),
        ),

        // add Loading (circular progress indicator at the end),
        // if there are more items to be loaded
        if (noMoreData) ...[
          const SizedBox(),
        ] else ...[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: CupertinoActivityIndicator(),
          ),
        ]
      ],
    );
  }

  void _onScrollListener(
      BuildContext context, ScrollController scrollController) {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    final remoteTutorialBloc = BlocProvider.of<RemoteTutorialsBloc>(context);
    final state = remoteTutorialBloc.blocProcessState;

    if (currentScroll == maxScroll && state == BlocProcessState.idle) {
      // print('ok');
      remoteTutorialBloc.add(const GetTutorials());
    }
  }

  void _onTutorialPressed(BuildContext context, Tutorial tutorial) {
    Navigator.pushNamed(context, '/TutorialDetailsView', arguments: tutorial);
  }

  void _onShowSavedTutorialsViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedTutorialsView');
  }
}
