import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:posts_app/data/contracts/post_contract.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/models/post_response.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit(this._postContract) : super(DetailInitial());

  final PostContract _postContract;

  final postDetailSubject = BehaviorSubject<PostsResponse>();


  Stream<PostsResponse> get postDetailStream =>
    postDetailSubject.stream;

  void getPostsById(int id) async{
    try {
      final result = await _postContract.getPostsById(id);
      postDetailSubject.add(result);
    } catch (e) {
      postDetailSubject.addError('$e');
    }
    
  }

}
