package com.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.model.Country;

public interface CountryRepository extends JpaRepository<Country, Integer>{

	List<Country> findByAcronym(String acronym);
	
	List<Country> findByName(String country);

	@Transactional
	@Modifying
	@Query(value="UPDATE country_master SET name=:name,acronym=:acronym,inn=:inn WHERE id=:id",nativeQuery=true)
	void updateCountry(@Param("id")int id,@Param("name") String name,@Param("acronym") String acronym, int inn);
	
	@Transactional
	@Modifying
	@Query(value="UPDATE country_master SET inn=:inn WHERE id=:id",nativeQuery=true)
	void updateCountry(@Param("id")int id,@Param("inn")int inn);

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM country_master WHERE id!=:id",nativeQuery=true)
	List<Country> findAllExceptId(int id);
}
