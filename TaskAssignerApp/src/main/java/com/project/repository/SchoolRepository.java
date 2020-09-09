package com.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.model.School;

public interface SchoolRepository extends JpaRepository<School, Integer> {

	@Transactional
	@Modifying
	@Query(value="UPDATE school s SET s.school_name=:school_name, s.board=:board, s.marks=:marks, s.percentage=:percentage, s.inn=:inn WHERE s.id=:id",nativeQuery=true)
	void update(@Param("id")int id,
			@Param("school_name")String school_name,
			@Param("board")String board,
			@Param("marks")int marks,
			@Param("percentage")double percentage,
			@Param("inn")int inn);

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM school s WHERE s.id!=:id ",nativeQuery=true)
	List<School> findAllExceptId(@Param("id")int id);

	@Transactional
	@Modifying
	@Query(value="UPDATE school s SET s.inn=:i WHERE s.id=:id",nativeQuery=true)
	void updateInnZero(@Param("id")int id, @Param("i")int i);
}
