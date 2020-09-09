package com.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.model.Bloodgroup;

public interface BloodgroupRepository extends JpaRepository<Bloodgroup, Integer>{

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM bloodgroup_master b where b.name=:name",nativeQuery=true)
	List<Bloodgroup> selectByName(@Param("name")String name);

	@Transactional
	@Modifying
	@Query(value="UPDATE bloodgroup_master SET name=:name,inn=:inn WHERE id=:id",nativeQuery=true)
	void updateBloodgroup(@Param("id")int id,@Param("name") String name,@Param("inn") int inn);

	@Transactional
	@Modifying
	@Query(value="UPDATE bloodgroup_master SET inn=:inn WHERE id=:id",nativeQuery=true)
	void updateBloodgroup(@Param("id")int id,@Param("inn")int inn);

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM bloodgroup_master WHERE id!=:id",nativeQuery=true)
	List<Bloodgroup> findAllExceptId(@Param("id")int id);

}
