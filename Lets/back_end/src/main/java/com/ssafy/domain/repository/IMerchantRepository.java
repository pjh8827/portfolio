package com.ssafy.domain.repository;

import java.util.List;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.repository.CrudRepository;

import com.ssafy.domain.Merchant;

public interface IMerchantRepository extends CrudRepository<Merchant, Long>{
	
	@EntityGraph("MerchantWithCategoryAndSigun")
	List<Merchant> findAll();
	
	@EntityGraph("MerchantWithCategoryAndSigun")
	List<Merchant> findByCmpnmNmLike(String cmpnmNm);

}
