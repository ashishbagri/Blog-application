package in.codeangles.jba.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import in.codeangles.jba.entity.Blog;
import in.codeangles.jba.entity.User;

public interface BlogRepository extends CrudRepository<Blog, Integer>{

	List<Blog> findBlogByUser(User user);

}
