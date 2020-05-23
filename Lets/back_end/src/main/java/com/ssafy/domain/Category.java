package com.ssafy.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@Table(name = "makedb_category")
public class Category implements Serializable{
	
	private static final long serialVersionUID = -3738971700074251058L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="cate_big")
	private String cateBig;
	
	@Column(name="cate_small")
	private String cateSmall;
	
	@OneToMany(mappedBy="category", fetch=FetchType.LAZY)
	@JsonIgnore
	private Set<Merchant> merchants = new LinkedHashSet<>();
	
}
