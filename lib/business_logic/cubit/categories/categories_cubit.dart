import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit()
      : super(
          CategoriesState(
              categories: ["All", "Condimenst", "Ustensiles", "Vaiselle"],
              selectedCategoryIndex: 0),
        );

  void selectCategory(int categoryIndex) {
    if (categoryIndex != state.selectedCategoryIndex) {
      emit(
        CategoriesState(
          categories: state.categories,
          selectedCategoryIndex: categoryIndex,
        ),
      );
    }
  }
}
