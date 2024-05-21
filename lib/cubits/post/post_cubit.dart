import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:posts_app/data/contracts/post_contract.dart';
import 'package:rxdart/rxdart.dart';
import '../../data/models/post_response.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this._postContract) : super(PostInitial());

  final PostContract _postContract;

  final postSubject = BehaviorSubject<PostsResponse?>();

  void getPosts() async{
    try {
      emit(PostLoading());
      final result = await _postContract.getPosts();
      emit(PostSuccess(result));
    } catch (e) {
      emit(PostFailure());
    }
    
  }


  @override
  Future<void> close() {
    postSubject.close();
    return super.close();
  }
}
