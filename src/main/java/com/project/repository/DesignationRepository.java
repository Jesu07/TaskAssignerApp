package com.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.model.Designation;

public interface DesignationRepository extends JpaRepository<Designation, Integer> {

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM designation b where b.name=:name",nativeQuery=true)
	List<Designation> selectByName(@Param("name")String name);

	@Transactional
	@Modifying
	@Query(value="UPDATE designation SET name=:name,inn=:inn WHERE id=:id",nativeQuery=true)
	void updateDesignation(@Param("id")int id,@Param("name") String name,@Param("inn") int inn);

	@Transactional
	@Modifying
	@Query(value="UPDATE designation SET inn=:inn WHERE id=:id",nativeQuery=true)
	void updateDesignation(@Param("id")int id,@Param("inn")int inn);

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM designation WHERE id!=:id",nativeQuery=true)
	List<Designation> findAllExceptId(@Param("id")int id);
}
