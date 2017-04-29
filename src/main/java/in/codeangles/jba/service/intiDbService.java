package in.codeangles.jba.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import in.codeangles.jba.entity.Blog;
import in.codeangles.jba.entity.Item;
import in.codeangles.jba.entity.Role;
import in.codeangles.jba.entity.User;
import in.codeangles.jba.repository.BlogRepository;
import in.codeangles.jba.repository.ItemRepository;
import in.codeangles.jba.repository.RoleRepository;
import in.codeangles.jba.repository.UserRepository;

@Transactional
@Service
public class intiDbService {

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BlogRepository blogRepository;

	@Autowired
	private ItemRepository itemRepository;
	
	@PostConstruct
	public void init(){
		
		Role adminRole = new Role();
		adminRole.setName("USER_ADMIN");
		roleRepository.save(adminRole);
		
		Role userRole = new Role();
		userRole.setName("USER_ROLE");
		roleRepository.save(userRole);
		
		User userAdmin = new User();
		userAdmin.setName("admin");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		userAdmin.setPassword(encoder.encode("admin"));
		List<Role> roles = new ArrayList<Role>();
		roles.add(adminRole);
		roles.add(userRole);
		userAdmin.setEnabled(true);
		userAdmin.setRoles(roles);
		userRepository.save(userAdmin);
		
		Blog sampleBlog = new Blog();
		sampleBlog.setName("First Blog");
		sampleBlog.setUrl("http:feeds.feedburner.com/javavids?format=xml");
		sampleBlog.setUser(userAdmin);
		blogRepository.save(sampleBlog);
		
		Item item1 = new Item();
		item1.setBlog(sampleBlog);
		item1.setTitle("First Item");
		item1.setLink("http://www.javavids.com");
		item1.setPublishedDate(new Date());
		itemRepository.save(item1);
		
		Item item2 = new Item();
		item2.setBlog(sampleBlog);
		item2.setTitle("Second Item");
		item2.setLink("http://www.javavids.com");
		item2.setPublishedDate(new Date());
		itemRepository.save(item2);
		
		List<Item> items = new ArrayList<Item>();
		items.add(item1);
		items.add(item2);
		
		
	}

}
