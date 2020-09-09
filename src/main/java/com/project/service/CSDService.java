package com.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.CSDMapping;
import com.project.repository.CSDRepository;

@Service
public class CSDService {

	@Autowired
	CSDRepository csdRepo;
	
	public List<CSDMapping> selectAll() {
		return csdRepo.findAll();
	}

	public void save(CSDMapping csd) {		
		csdRepo.save(csd);
	}

	public CSDMapping selectById(int id) {
		List<CSDMapping> list = csdRepo.findAll();
		for(CSDMapping c:list) {
			if(c.getId() == id)
				return c;
		}
		return null;
	}

	public void updateInn(int id, int i) {
		csdRepo.updateInn(id,i);
	}

	public List<CSDMapping> selectAllStateByCountryId(int id) {
		List<CSDMapping> list = csdRepo.findAll();
		List<CSDMapping> fin = new ArrayList<CSDMapping>();
		for(CSDMapping c : list) {
			if(c.getCountry().getId() == id) {
				fin.add(c);
			}
		}
		return fin;
	}

	public List<CSDMapping> selectAllDistrictByStateId(int countryid,int stateid) {
		List<CSDMapping> list = csdRepo.findAll();
		List<CSDMapping> fin = new ArrayList<CSDMapping>();
		for(CSDMapping c : list) {
			if(c.getState().getId() == stateid && c.getCountry().getId() == countryid) {
				fin.add(c);
			}
		}
		return fin;
	}

	public CSDMapping selectByCSDId(int p_country, int p_state, int p_district) {
		List<CSDMapping> list = csdRepo.findAll();
		for(CSDMapping c : list) {
			if(c.getCountry().getId() == p_country && c.getState().getId() == p_state && c.getDistrict().getId() == p_district)
				return c;
		}
		return null;
	}

	public CSDMapping selectByAllColumnId(int country, int state, int district) {
		List<CSDMapping> list = csdRepo.findAll();
		for(CSDMapping c : list) {
			if(c.getCountry().getId() == country && c.getState().getId() == state && c.getDistrict().getId() == district){
				return c;
			}
		}
		return null;
	}
	
}
