package com.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.model.Language;

public interface LanguageRepository extends JpaRepository<Language, Integer>{

	@Transactional
	@Modifying
	@Query(value="UPDATE language_master l SET l.name=:name, l.inn=:inn WHERE l.id=:id",nativeQuery=true)
	void update(@Param("id")int id, @Param("name")String name, @Param("inn")int inn);

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM language_master l WHERE l.id!=:id ",nativeQuery=true)
	List<Language> findAllExceptId(@Param("id")int id);

	@Transactional
	@Modifying
	@Query(value="UPDATE language_master l SET l.inn=:i WHERE l.id=:id",nativeQuery=true)
	void updateInnZero(@Param("id")int id, @Param("i")int i);
}
