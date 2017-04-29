package in.codeangles.jba.repository;

import org.springframework.data.repository.CrudRepository;

import in.codeangles.jba.entity.User;

public interface UserRepository extends CrudRepository<User, Integer>{

	User findByName(String name);

}
