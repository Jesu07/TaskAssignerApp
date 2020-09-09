package com.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.model.State;

public interface StateRepository extends JpaRepository<State, Integer>{

	@Transactional
	@Modifying
	@Query(value="UPDATE state_master s SET s.name=:name,s.acronym=:acronym,s.inn=:inn WHERE s.id=:id",nativeQuery=true)
	void update(@Param("name")String name,@Param("acronym") String acronym, @Param("inn") int i,@Param("id") int id);

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM state_master s WHERE s.id!=:id",nativeQuery=true)
	List<State> findAllExceptId(int id);

	@Transactional
	@Modifying
	@Query(value="UPDATE state_master s SET s.inn=:inn WHERE s.id=:id",nativeQuery=true)
	void updateInn(@Param("id")int id, @Param("inn")int i);
	
}
