package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.Bloodgroup;
import com.project.repository.BloodgroupRepository;

@Service
public class BloodgroupService {

	@Autowired
	BloodgroupRepository bgmrepo;
	
	public void saveBloodgroupMaster(Bloodgroup bgm) {
		bgmrepo.save(bgm);
	}
	
	public List<Bloodgroup> selectAll(){
		List<Bloodgroup> list = bgmrepo.findAll();
		return list;
	}

	public List<Bloodgroup> selectByName(String name) {
		List<Bloodgroup> list = bgmrepo.selectByName(name);
		return list;
	}

	public void updateBloodgroup(int id, String name, int inn) {
		bgmrepo.updateBloodgroup(id, name, inn);
	}
	
	public void deleteById(int id) {
		bgmrepo.deleteById(id);		
	}

	public void updateInnZero(int id) {
		bgmrepo.updateBloodgroup(id,0);
	}

	public List<Bloodgroup> selectAllExceptId(int id) {
		return bgmrepo.findAllExceptId(id);
	}
	
	public Bloodgroup selectById(int id) {
		List<Bloodgroup> list = bgmrepo.findAll();
		for(Bloodgroup b : list) {
			if(b.getId() == id)
				return b;
		}
		return null;
	}
}
