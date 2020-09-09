package com.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.model.Users;

public interface UserRepository extends JpaRepository<Users, Integer> {

	Users findByUsername(String username);
	
	Users findByEmail(String email);
	
	@Transactional
	@Modifying
	@Query(value="SELECT * FROM users where password=:password",nativeQuery=true)
	Users findByPassword(@Param("password")String password);
	
	@Transactional
	@Modifying
	@Query(value="SELECT * FROM users where user_id=:id",nativeQuery=true)
	List<Users> findById(@Param("id")int id);

	@Transactional
	@Modifying
	@Query(value="UPDATE users SET password=:password WHERE user_id=:id",nativeQuery=true)
	void updatePassword(@Param("password")String password,@Param("id")int i);

	@Transactional
	@Modifying
	@Query(value="UPDATE users SET role=:role, name=:name, email=:email, username=:username, password=:password, inn=:inn WHERE user_id=:id",nativeQuery=true)
	void updateUser(@Param("id")int id,@Param("role")String role,@Param("name")String name,@Param("email")String email,@Param("username")String username,@Param("password")String password, @Param("inn")int inn);

	@Transactional
	@Modifying
	@Query(value="UPDATE users SET inn=:i WHERE user_id=:id",nativeQuery=true)
	void updateInnZero(@Param("id")int id, @Param("i")int i);

	@Transactional
	@Modifying
	@Query(value="UPDATE users SET personal_status=:personal_status WHERE user_id=:id",nativeQuery=true)
	void updatePersonalStatus(@Param("id")int id,@Param("personal_status") int status);
	
	@Transactional
	@Modifying
	@Query(value="SELECT * FROM users WHERE user_id!=:id",nativeQuery=true)
	List<Users> findAllById(@Param("id")int id);
	
	@Transactional
	@Modifying
	@Query(value="SELECT * FROM users WHERE role='admin'",nativeQuery=true)
	List<Users> findAllAdministrators();

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM users WHERE role='user'",nativeQuery=true)
	List<Users> findAllUsers();

}
