package in.codeangles.jba.service;

import in.codeangles.jba.entity.Blog;
import in.codeangles.jba.entity.Item;
import in.codeangles.jba.entity.Role;
import in.codeangles.jba.entity.User;
import in.codeangles.jba.repository.BlogRepository;
import in.codeangles.jba.repository.ItemRepository;
import in.codeangles.jba.repository.RoleRepository;
import in.codeangles.jba.repository.UserRepository;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRespository;
	
	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private ItemRepository itemRepository;
	
	public List<User> findAll(){
		return (List<User>) userRepository.findAll();
	}

	public User findOne(int id) {
		return userRepository.findOne(id);
	}

	@Transactional
	public User findOneWithBlogs(int id) {
		User user = findOne(id);
		List<Blog> blogs = blogRepository.findBlogByUser(user);
		for(Blog blog : blogs){
			List<Item> items = itemRepository.findItemsByBlog(blog, new PageRequest(0, 10, Direction.DESC, "publishedDate"));
			blog.setItems(items);
		}
		user.setBlogs(blogs);
		return user;
	}

	public void save(User user) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword()));
		user.setEnabled(true);
		List<Role> roles = new ArrayList<Role>();
		Role role = new Role();
		role.setName("USER_ROLE");
		roleRespository.save(role);
		roles.add(role);
		user.setRoles(roles);
		userRepository.save(user);
	}

	public User findOneWithName(String name) {
		User user = userRepository.findByName(name);
		return findOneWithBlogs(user.getId());
	}
}
