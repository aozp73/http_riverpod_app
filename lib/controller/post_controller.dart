
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/dto/post/post_response_dto.dart';
import 'package:http_riverpod_app/model/post/post.dart';
import 'package:http_riverpod_app/model/post/post_repository.dart';
import 'package:http_riverpod_app/view/pages/post/home/post_home_page_view_model.dart';

// PostController는 ref에 접근하지 못하므로, 접근하려고 생성(주입)
final postController = Provider<PostController>((ref) {
  return PostController(ref);
});

class PostController{
  Ref ref;
  PostController(this.ref);

  Future<void> findPosts() async {
    List<Post> postDtoList = await PostRepository().findAll();
    ref.read(postHomePageProvider.notifier).init(postDtoList);
  }

  Future<void> addPost(String title) async {
    Post post = await PostRepository().save(title);
    ref.read(postHomePageProvider.notifier).add(post);
  }

  Future<void> removePost(int id) async{
    await PostRepository().deleteById(id);
    ref.read(postHomePageProvider.notifier).remove(id);
  }

  Future<void> updatePost(Post post) async{
    Post postPS = await PostRepository().update(post);
    ref.read(postHomePageProvider.notifier).update(postPS);
  }
}
