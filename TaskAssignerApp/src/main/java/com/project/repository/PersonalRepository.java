package com.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.model.Bloodgroup;
import com.project.model.Community;
import com.project.model.Country;
import com.project.model.Designation;
import com.project.model.Language;
import com.project.model.Personal;
import com.project.model.Religion;

public interface PersonalRepository extends JpaRepository<Personal, Integer> {

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM personal b where b.name=:name",nativeQuery=true)
	List<Personal> selectByName(@Param("name")String name);

	@Transactional
	@Modifying
	@Query(value="UPDATE personal SET "
			+ "designation=:designation, "
			+ "mobile=:mobile, "
			+ "gender=:gender, "
			+ "dob=:dob, "
			+ "blood_group=:blood_group, "
			+ "mother_tongue=:mother_tongue, "
			+ "place_of_birth=:place_of_birth, "
			+ "nationality=:nationality, "
			+ "religion=:religion, "
			+ "category=:community, "
			+ "image_name=:imageName, "
			+ "image_path=:imagePath, "
			+ "image_size=:imageSize, "
			+ "image_type=:imageType "
			+ "WHERE id=:id",nativeQuery=true)
	void updatePersonal(
			@Param("id")int id,
			@Param("designation") Designation designation,
			@Param("mobile") String mobile,
			@Param("gender") String gender,
			@Param("dob") String dob,
			@Param("blood_group") Bloodgroup bloodgroup,
			@Param("mother_tongue") Language language,
			@Param("place_of_birth") String place_of_birth,
			@Param("nationality") Country country,
			@Param("religion") Religion religion,
			@Param("community") Community community,
			@Param("imageName") String image_name,
			@Param("imagePath") String image_path,
			@Param("imageSize") String image_size,
			@Param("imageType") String image_type);

	@Transactional
	@Modifying
	@Query(value="UPDATE personal SET inn=:inn WHERE id=:id",nativeQuery=true)
	void updateInn(@Param("id")int id,@Param("inn")int inn);

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM personal WHERE id!=:id",nativeQuery=true)
	List<Personal> findAllExceptId(@Param("id")int id);

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM personal WHERE user_ref=:user",nativeQuery=true)
	List<Personal> findUserImageByUserID(@Param("user") int user);
}
