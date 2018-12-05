package com.chandra.prakash.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.chandra.prakash.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{
	
	/*@Query("Select u from User u where u.emailID = :emailID")
	public User getUserByEmailID(@Param("emailID") String emailID);*/

	Optional<User> findByEmailID(String emailID);
}
