import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import 'package:tutorial/src/domain/entities/tutorial/tutorial.dart';
import 'package:tutorial/src/injector.dart';
import 'package:tutorial/src/presentation/blocs/remote_tutorials/remote_tutorials_bloc.dart';
import 'package:tutorial/src/presentation/widgets/tutorial_widget.dart';

class SavedTutorialsView extends HookWidget {
  const SavedTutorialsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          injector<RemoteTutorialsBloc>()..add(const GetAllSavedTutorials()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Ionicons.chevron_back, color: Colors.black),
        ),
      ),
      title:
          const Text('Saved tutorials', style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<RemoteTutorialsBloc, RemoteTutorialsState>(
      builder: (context, state) {
        if (state is RemoteTutorialsLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is RemoteTutorialsDone) {
          return _buildTutorialsList(state.tutorials!);
        }
        return Container();
      },
    );
  }

  Widget _buildTutorialsList(List<Tutorial> tutorials) {
    if (tutorials.isEmpty) {
      return const Center(
          child: Text(
        'NO SAVED tutorialS',
        style: TextStyle(color: Colors.black),
      ));
    }

    return ListView.builder(
      itemCount: tutorials.length,
      itemBuilder: (context, index) {
        return TutorialWidget(
          tutorial: tutorials[index],
          isRemovable: true,
          onRemove: (tutorial) => _onRemoveTutorial(context, tutorial),
          onTutorialPressed: (tutorial) =>
              _onTutorialPressed(context, tutorial),
        );
      },
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onRemoveTutorial(BuildContext context, Tutorial tutorial) {
    BlocProvider.of<RemoteTutorialsBloc>(context).add(RemoveTutorial(tutorial));
  }

  void _onTutorialPressed(BuildContext context, Tutorial tutorial) {
    Navigator.pushNamed(context, '/TutorialDetailsView', arguments: tutorial);
  }
}
