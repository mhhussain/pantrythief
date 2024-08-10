import 'package:flutter/material.dart' hide BottomAppBar;
import 'package:pantrythief/domain/usecases/get_recipes_usecase.dart';
import 'package:pantrythief/injection_container.dart';
import 'package:pantrythief/ui/view_models/recipes_view_model.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';
import 'package:pantrythief/ui/widgets/atoms/text_title.dart';
import 'package:pantrythief/ui/widgets/shared/bottom_app_bar.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  bool isLoading = true;
  
  RecipesViewModel model = RecipesViewModel(recipes: []);
  final GetRecipesUseCase _getRecipesUseCase = locator<GetRecipesUseCase>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final recipes = await _getRecipesUseCase();
    setState(() {
      model = RecipesViewModel(recipes: recipes.data!);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle('Recipes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...model.recipes.map((r) {
              return TextSmall(r.instructions);
            })
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(current: 1,),
    );
  }
}