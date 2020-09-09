package com.project.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.model.CSDMapping;

public interface CSDRepository extends JpaRepository<CSDMapping,Integer> {

	@Transactional
	@Modifying
	@Query(value="UPDATE csd c SET c.inn=:inn WHERE c.id=:id",nativeQuery=true)
	void updateInn(@Param("id")int id,@Param("inn") int i);

}
