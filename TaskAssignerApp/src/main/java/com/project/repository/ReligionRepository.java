package com.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.model.Religion;

public interface ReligionRepository extends JpaRepository<Religion, Integer>{

	@Transactional
	@Modifying
	@Query(value="UPDATE religion_master r SET r.name=:name, r.inn=:inn WHERE r.id=:id",nativeQuery=true)
	void update(@Param("id")int id, @Param("name")String name, @Param("inn")int inn);

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM religion_master r WHERE r.id!=:id ",nativeQuery=true)
	List<Religion> findAllExceptId(@Param("id")int id);

	@Transactional
	@Modifying
	@Query(value="UPDATE religion_master r SET r.inn=:i WHERE r.id=:id",nativeQuery=true)
	void updateInnZero(@Param("id")int id, @Param("i")int i);
}
