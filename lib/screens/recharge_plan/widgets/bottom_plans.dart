import '../../../common_libs.dart';
import '../provider/categories_provider.dart';
import 'bottom_boxes.dart';

class BottomPlans extends StatelessWidget {
  final TabController ctr;
  final String displayName,  displayNumber;
  const BottomPlans({Key? key, required this.ctr, required this.displayName, required this.displayNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoriesProvider>(context);

    return categoryProvider.categoryData?.length != 0? Expanded(
      child: Container(
        height: 570.h,
        child: TabBarView(
            controller: ctr,
            children:
            List.generate(categoryProvider.categoryData!.length, (index) => BottomBoxes(
              index: index,
              name: displayName,
              phone: displayNumber,
            ))
        ),
      ),
    ): CircularProgressIndicator();
  }
}
