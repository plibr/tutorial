import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tutorial/src/presentation/blocs/remote_tutorials/remote_tutorials_bloc.dart';

import 'package:tutorial/src/domain/entities/tutorial/tutorial.dart';
import 'package:tutorial/src/injector.dart';

class TutorialDetailsView extends HookWidget {
  final Tutorial? tutorial;

  const TutorialDetailsView({Key? key, this.tutorial}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<RemoteTutorialsBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
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
    );
  }

  Widget _buildBody() {
    return const Center(child: Text('Text'));
  }

  Widget _buildFloatingActionButton() {
    return Builder(
      builder: (context) => FloatingActionButton(
        onPressed: () => _onFloatingActionButtonPressed(context),
        child: const Icon(Ionicons.bookmark, color: Colors.white),
      ),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onFloatingActionButtonPressed(BuildContext context) {
    BlocProvider.of<RemoteTutorialsBloc>(context).add(SaveTutorial(tutorial));

    Scaffold.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.black,
        content: Text('Tutorial saved successfully.'),
      ),
    );
  }
}
