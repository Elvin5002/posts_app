import 'package:get_it/get_it.dart';
import 'package:posts_app/data/contracts/post_contract.dart';
import 'package:posts_app/data/repositories/post_repository.dart';
import 'package:posts_app/data/services/post_service.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async{
  locator.registerLazySingleton(() => PostService());
  locator.registerLazySingleton<PostContract>(() => PostRepository(locator()));

  //throw Exception();
}