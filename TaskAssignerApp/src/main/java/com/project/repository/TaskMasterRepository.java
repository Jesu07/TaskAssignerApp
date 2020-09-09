package com.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.model.TaskMaster;

public interface TaskMasterRepository extends JpaRepository<TaskMaster, Integer> {

	@Transactional
	@Modifying
	@Query(value="UPDATE task_master SET task_name=:tn,description=:td,inn=:inn WHERE id=:id",nativeQuery=true)
	void updateTask(@Param("id")int id,@Param("tn") String task_name,@Param("td") String description,@Param("inn") int inn);

	@Transactional
	@Modifying
	@Query(value="UPDATE task_master SET inn=:inn WHERE id=:id",nativeQuery=true)
	void updateTask(@Param("id")int id,@Param("inn")int inn);

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM task_master WHERE id!=:id",nativeQuery=true)
	List<TaskMaster> findAllExceptId(int id);
}
