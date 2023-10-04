import 'package:injectable/injectable.dart';
import 'package:interesting_places/features/category/data/data_source/category_data_source.dart';
import 'package:interesting_places/features/category/data/models/category.dart';

@Injectable()
class CategoryRepository {
  List<Category> getCategoryList() {
    return categoryList;
  }
}
