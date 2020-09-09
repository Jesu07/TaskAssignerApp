package com.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.model.TaskMapping;

public interface TaskMappingRepository extends JpaRepository<TaskMapping, Integer> {

	@Transactional
	@Modifying
	@Query(value="UPDATE task_assignment SET inn=:inn WHERE id=:id",nativeQuery=true)
	void updateInnZero(@Param("id")int id,@Param("inn")int inn);

	@Transactional
	@Modifying
	@Query(value="UPDATE task_assignment SET inn=:i WHERE id=:id",nativeQuery=true)
	void updateInn(@Param("id")int id, @Param("i")int i);
	
	@Transactional
	@Modifying
	@Query(value="SELECT * FROM task_assignment WHERE id!=:id",nativeQuery=true)
	List<TaskMapping> findAllExceptId(int id);

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM task_assignment WHERE user_ref=:id",nativeQuery=true)
	List<TaskMapping> selectAllTasksByUserId(int id);

	@Transactional
	@Modifying
	@Query(value="UPDATE task_assignment SET extension_description=:extension_description WHERE id=:id",nativeQuery=true)
	void updateExtension(@Param("id") int id,@Param("extension_description") String extension_description);

	@Transactional
	@Modifying
	@Query(value="UPDATE task_assignment SET completion_date=:completion_date, completion_description=:completion_description WHERE id=:id",nativeQuery=true)
	void UpdateResponse(@Param("id") int id,@Param("completion_date") String completion_date,@Param("completion_description") String completion_description);
	
	@Transactional
	@Modifying
	@Query(value="UPDATE task_assignment SET extended_deadline=:deadline, reminder=:reminder WHERE id=:id",nativeQuery=true)
	void extendDeadline(@Param("id") int id,@Param("deadline") String deadline,@Param("reminder") int reminder);
	
	@Transactional
	@Modifying
	@Query(value="UPDATE task_assignment SET completion_status=:i, score=:score WHERE id=:id",nativeQuery=true)
	void validateResponse(@Param("id") int id,@Param("i")  int i,@Param("score")  int score);
	
}
