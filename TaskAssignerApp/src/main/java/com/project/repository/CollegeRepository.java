package com.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.model.College;

public interface CollegeRepository extends JpaRepository<College, Integer> {

	@Transactional
	@Modifying
	@Query(value="UPDATE college c SET c.clg_name=:clg_name, c.course=:course, c.university=:university, c.cgpa=:cgpa, c.inn=:inn WHERE c.id=:id",nativeQuery=true)
	void update(@Param("id")int id,
			@Param("clg_name")String clg_name,
			@Param("course")String course,
			@Param("university")String university,
			@Param("cgpa")double cgpa,
			@Param("inn")int inn);

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM college c WHERE c.id!=:id ",nativeQuery=true)
	List<College> findAllExceptId(@Param("id")int id);

	@Transactional
	@Modifying
	@Query(value="UPDATE college c SET c.inn=:i WHERE c.id=:id",nativeQuery=true)
	void updateInnZero(@Param("id")int id, @Param("i")int i);
}
