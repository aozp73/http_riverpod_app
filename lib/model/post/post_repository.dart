import 'package:http_riverpod_app/dto/post/post_response_dto.dart';
import 'package:http_riverpod_app/model/post/post.dart';

class PostRepository {
  // 싱글톤 진행 (호출했을 때 메모리에 있으면 또 다시 new 안함)
  static PostRepository _instance = PostRepository._single();

  // 이름있는 생성자를 때려서 최초에 null 방지
  PostRepository._single();

  factory PostRepository() {
    return _instance;
  }

  Future<List<Post>> findAll() {
    return Future.delayed(Duration(seconds: 1), (){
      return [
        Post(id: 1, title: "제목1"),
        Post(id: 2, title: "제목2"),
        Post(id: 3, title: "제목3"),
      ];
    });
  }

  Future<void>? save() {
    return null;
  }
}
