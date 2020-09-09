package com.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.model.District;

public interface DistrictRepository extends JpaRepository<District, Integer>{

	@Transactional
	@Modifying
	@Query(value="UPDATE district_master d SET d.name=:name,d.acronym=:acronym,d.inn=:inn WHERE d.id=:id",nativeQuery=true)
	void update(@Param("name")String name,@Param("acronym")String acronym,@Param("inn")int inn,@Param("id")int id);
	
	@Transactional
	@Modifying
	@Query(value="UPDATE district_master d SET d.inn=:inn WHERE d.id=:id",nativeQuery=true)
	void updateInn(@Param("id")int id, @Param("inn")int i);
	
	@Transactional
	@Modifying
	@Query(value="SELECT * FROM district_master d WHERE d.id!=:id",nativeQuery=true)
	List<District> findAllExceptId(@Param("id")int id);

}
