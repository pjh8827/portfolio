package com.ssafy.domain.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.ssafy.domain.Merchant;
import com.ssafy.domain.repository.IMerchantRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MerchantService {

	private final IMerchantRepository repository;
	
	@Transactional
	public List<Merchant> findAll() {
		
		List<Merchant> list = new ArrayList<>();
		Iterable<Merchant> merchants = repository.findAll();
		
		merchants.forEach(list::add);
		List<Merchant> merchantsBy100 = list.subList(0, 100);
		return merchantsBy100;
	}
	
	@Transactional
	public List<Merchant> findByCmpnmNmLike(String cmpnmNm){
		
		List<Merchant> merchants = repository.findByCmpnmNmLike("%" + cmpnmNm + "%");
		List<Merchant> merchantsBy100 = merchants.subList(0, 100);
		return merchantsBy100;
	}
	
}
