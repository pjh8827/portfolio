package com.ssafy.domain.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import com.ssafy.domain.Category;
import com.ssafy.domain.Merchant;
import com.ssafy.domain.repository.ICategoryRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CategoryService {

	private final ICategoryRepository repository;

	@Transactional
	public List<Category> findAll() {

		List<Category> list = new ArrayList<>();
		Iterable<Category> categories = repository.findAll();

		categories.forEach(list::add);
		return list;
	}

	@Transactional
	public List<Merchant> findByCateBigLike(String cateBig) {

		List<Category> categories = repository.findByCateBigLike("%" + cateBig + "%");

		List<Merchant> merchants = new ArrayList<>();

		for (Category category : categories) {
			category.getMerchants().forEach(merchants::add);
		}
		
		List<Merchant> merchantsBy100 = merchants.subList(0, 100);

		return merchantsBy100;
	}

}
