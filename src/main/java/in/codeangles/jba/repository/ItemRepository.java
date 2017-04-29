package in.codeangles.jba.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import in.codeangles.jba.entity.Blog;
import in.codeangles.jba.entity.Item;

public interface ItemRepository extends CrudRepository<Item, Integer>{

	List<Item> findItemsByBlog(Blog blog,Pageable pageable);

}
