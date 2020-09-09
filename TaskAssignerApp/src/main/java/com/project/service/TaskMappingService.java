package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.TaskMapping;
import com.project.repository.TaskMappingRepository;

@Service
public class TaskMappingService {

	@Autowired 
	TaskMappingRepository tamRepo;
	
	public void saveTaskMapping(TaskMapping tam) {
		tamRepo.save(tam);
	}
	
	public List<TaskMapping> selectAll(){
		List<TaskMapping> list = tamRepo.findAll();
		return list;
	}

	public List<TaskMapping> selectAllTasksByUserID(int id) {
		return tamRepo.selectAllTasksByUserId(id);
	}
	
	public void deleteById(int id) {
		tamRepo.deleteById(id);		
	}

	public void updateInnZero(int id) {
		tamRepo.updateInnZero(id,0);
	}

	public void updateInn(int id, int i) {
		tamRepo.updateInn(id,i);
	}
	
	public List<TaskMapping> selectAllExceptId(int id) {
		return tamRepo.findAllExceptId(id);
	}

	public TaskMapping selectById(int id) {
		List<TaskMapping> list = tamRepo.findAll();
		for(TaskMapping t : list) {
			if(id == t.getId())
				return t;
		}
		return null;
	}
	
	public void requestExtension(int id, String extension_description) {
		tamRepo.updateExtension(id,extension_description);
	}

	public void updateResponse(int id, String completion_date, String completion_description) {
		tamRepo.UpdateResponse(id,completion_date,completion_description);
	}

	public void extendDeadline(int id, String deadline, int reminder) {
		tamRepo.extendDeadline(id,deadline,reminder);
	}

	public void validateResponse(int id, int i, int score) {
		tamRepo.validateResponse(id,i,score);
	}
}
