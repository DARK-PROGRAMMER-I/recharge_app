import '../../../common_libs.dart';
import '../provider/categories_provider.dart';

class CategoriesTabBar extends StatelessWidget {
  final TabController ctr;

  const CategoriesTabBar({Key? key, required this.ctr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoriesProvider>(context);

    return Container(
      height: 50.h,
      width: 900.w,
      child: TabBar(
          isScrollable: true,
          physics: ScrollPhysics(),
          controller: ctr,
          indicatorWeight: 5,
          labelColor: Colors.black87,
          tabs: List.generate(categoryProvider.categoryData?.length ?? 3, (index) {
            return Tab(text: categoryProvider.categoryData?[index].categoryName);
          })

      ),
    );
  }
}
