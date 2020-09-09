package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.Community;
import com.project.repository.CommunityRepository;

@Service
public class CommunityService {

	@Autowired
	CommunityRepository cmrepo;
	
	public void saveCommunityMaster(Community cm) {
		cmrepo.save(cm);
	}
	
	public List<Community> selectAll(){
		List<Community> list = cmrepo.findAll();
		return list;
	}

	public Community selectByAcronym(String acronym) {
		Community com = new Community();
		List<Community> list = cmrepo.findByAcronym(acronym);
		for(Community c : list) {
			if(c.getAcronym().equalsIgnoreCase(acronym)) {
				com.setId(c.getId());
				com.setName(c.getName());
				com.setAcronym(c.getAcronym());
				com.setInn(c.getInn() == 0?false:true );
				return com;
			}
		}
		return null;
	}
	
	public Community selectByCommunity(String name){
		List<Community> list = cmrepo.findByName(name);
		Community com = new Community();
		for(Community c : list) {
			if(c.getName().equalsIgnoreCase(name)) {
				com.setId(c.getId());
				com.setName(c.getName());
				com.setAcronym(c.getAcronym());
				com.setInn(c.getInn() == 0?false:true);
				return com;
			}
		}
		return null;
	}

	public Community selectByAll(String acronym,String name,int inn) {
		System.out.println(acronym);
		List<Community> list = cmrepo.findAll();
		Community com = new Community();
		for(Community c : list) {
			if(inn == c.getInn() && name.equalsIgnoreCase(c.getName()) && acronym.equalsIgnoreCase(c.getAcronym()) ) {
				com.setId(c.getId());
				com.setName(c.getName());
				com.setAcronym(c.getAcronym());
				com.setInn(c.getInn() == 0?false:true);
				return com;
			}
		}
		return null;
	}

	public void updateCommunity(String name, String acronym, int inn, int id) {
		cmrepo.update(name, acronym, inn, id);
	}
	
	public Community selectByNames(String acronym,String name) {
		List<Community> list = cmrepo.findByNames(name, acronym);
		Community com = new Community();
		if(list.size() != 0 ) {
			for(Community c : list) {
				com.setName(c.getName());
				com.setAcronym(c.getAcronym());
				com.setInn(c.getInn() == 0?false:true);
			}
		}
		return null;
	}

	public void updateInnZero(int id) {
		cmrepo.updateBatch(id, 0);
	}

	public List<Community> selectAllExceptId(int id) {
		return cmrepo.findAllExceptId(id);
	}
	
	public Community selectById(int id) {
		List<Community> list = cmrepo.findAll();
		for(Community d : list) {
			if(d.getId() == id)
				return d;
		}
		return null;
	}
	
}
