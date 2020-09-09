package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.TaskMaster;
import com.project.repository.TaskMasterRepository;

@Service
public class TaskMasterService {

	@Autowired
	TaskMasterRepository tmRepo;
	
	public void saveTaskMaster(TaskMaster tsm) {
		tmRepo.save(tsm);
	}
	
	public List<TaskMaster> selectAll(){
		List<TaskMaster> list = tmRepo.findAll();
		return list;
	}

	public void updateTaskMaster(int id, String task_name, String description,  int inn) {
		tmRepo.updateTask(id,task_name,description,inn);
	}

	public void deleteById(int id) {
		tmRepo.deleteById(id);		
	}

	public void updateInnZero(int id) {
		tmRepo.updateTask(id,0);
	}

	public List<TaskMaster> selectAllExceptId(int id) {
		return tmRepo.findAllExceptId(id);
	}

	public TaskMaster selectById(int id) {
		List<TaskMaster> list = tmRepo.findAll();
		for(TaskMaster t : list) {
			if(id == t.getId())
				return t;
		}
		return null;
	}
}
