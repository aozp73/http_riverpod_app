
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/dto/post/post_response_dto.dart';
import 'package:http_riverpod_app/model/post/post.dart';

// 다른 페이지에도 postDto가 있을 수 있으므로 해당 페이지를 앞에 붙여서 명명
// 창고 관리자(Provider), 창고에 HomePageViewModel()를 가지고 있음
final postHomePageProvider = StateNotifierProvider<PostHomePageViewModel, PostHomePageModel?>((ref) {
  return PostHomePageViewModel(null);
});

// 창고(Store), HomePageModel를 관리
class PostHomePageViewModel extends StateNotifier<PostHomePageModel?>{
  PostHomePageViewModel(super.state);

  void init(List<Post> postDtoList){
    state = PostHomePageModel(posts: postDtoList);
  }
}

// 창고 데이터, 해당 페이지에 필요한 데이터를 담을 Model
// 해당 페이지에서 여러 타입의 오브젝트가 필요할 수 있어서 여기에 담고
// 창고에 전달
class PostHomePageModel {
  // 최초에 return HomePageViewModel(HomePageModel());에 초기값없이 넣으려면 ?
  List<Post> posts = [];
  PostHomePageModel({required this.posts});
}



