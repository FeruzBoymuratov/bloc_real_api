import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/list_post_cubit.dart';
import '../bloc/list_post_state.dart';
import '../model/contact_model.dart';
import '../views/view_of_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<Contact> items = [];

  @override
  void initState() {
    super.initState();

    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: BlocBuilder<ListPostCubit, ListPostState> (
        builder: (BuildContext context, ListPostState state) {
          if (state is ListPostError) {
            return viewOfHome(items, true);
          }

          if (state is ListPostLoaded) {
            items = state.posts;
            return viewOfHome(items, false);
          }

          return viewOfHome(items, true);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        child: const Icon(
            Icons.add
        ),
        onPressed: () {
          BlocProvider.of<ListPostCubit>(context).callCreatePage(context);
        },
      ),
    );
  }
}