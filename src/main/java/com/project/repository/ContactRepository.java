package com.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.model.Contact;

public interface ContactRepository extends JpaRepository<Contact, Integer> {

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM contact",nativeQuery=true)
	List<Contact> selectAll();
	
	@Transactional
	@Modifying
	@Query(value="UPDATE contact c SET c.door_no=:door_no, c.street=:street, c.village=:village, c.city=:city, c.country=:country, c.state=:state, c.district=:district, c.pincode=:pincode, c.inn=:inn WHERE c.id=:id",nativeQuery=true)
	void update(@Param("id")int id,@Param("door_no")String door_no,@Param("street")String street,@Param("village")String village,@Param("city")String city,@Param("country")int country,@Param("state")int state,@Param("district")int district,@Param("pincode")int pincode,@Param("inn")int inn);

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM contact c WHERE c.id!=:id ",nativeQuery=true)
	List<Contact> findAllExceptId(@Param("id")int id);

	@Transactional
	@Modifying
	@Query(value="UPDATE contact c SET c.inn=:i WHERE c.id=:id",nativeQuery=true)
	void updateInnZero(@Param("id")int id, @Param("i")int i);
}
