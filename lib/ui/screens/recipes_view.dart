import 'package:flutter/material.dart' hide BottomAppBar;
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';
import 'package:pantrythief/ui/widgets/atoms/text_title.dart';
import 'package:pantrythief/ui/widgets/shared/bottom_app_bar.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _IngredientsViewState();
}

class _IngredientsViewState extends State<RecipesView> {

  @override
  void initState() {
    // retrieve recipes list from shared_preferences

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle('Recipes'),
      ),
      body: const Center(child: TextSmall('data')),
      bottomNavigationBar: const BottomAppBar(current: 1,),
    );
  }
}