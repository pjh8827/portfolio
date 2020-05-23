package com.ssafy.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedAttributeNode;
import javax.persistence.NamedEntityGraph;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString(exclude = {"category", "sigun"})
@NoArgsConstructor
@Table(name = "makedb_merchant")
@NamedEntityGraph(name="MerchantWithCategoryAndSigun", attributeNodes = {@NamedAttributeNode("category"), @NamedAttributeNode("sigun")})
public class Merchant implements Serializable{
	
	private static final long serialVersionUID = 7645597484064897497L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@Column(name="cmpnm_nm", nullable=false)
	private String cmpnmNm;
	
	@Column(name="refine_roadnm_addr")
	private String refineRoadnmAddr;
	
	@Column(name="refine_lotno_addr")
	private String refineLotnoAddr;
	
	@Column(name="telno")
	private String telno;
	
	@Column(name="region_mny_nm")
	private String regionMnyNm;
	
	@Column(name="brnhstrm_mny_use_posbl_yn")
	private String brnhstrmMnyUsePosblYn;
	
	@Column(name="card_mny_use_posbl_yn")
	private String cardMnyUsePosblYn;
	
	@Column(name="mobile_mny_use_posbl_yn")
	private String mobileMnyUsePosblYn;
	
	@Column(name="refine_zip_cd")
	private String refineZipCd;
	
	@Column(name="latitude")
	private String latitude;
	
	@Column(name="longitude")
	private String longitude;
	
	@ManyToOne
	@JoinColumn(name="category_id", foreignKey = @ForeignKey(name = "FK_MERCHANT_CATEGORY"))
	private Category category;
	
	@ManyToOne
	@JoinColumn(name="sigun_id", foreignKey = @ForeignKey(name = "FK_MERCHANT_SIGUN"))
	private Sigun sigun;

	
	public void setCategory(Category category) {
		this.category = category;
		category.getMerchants().add(this);
	}
	
	public void setSigun(Sigun sigun) {
		this.sigun = sigun;
		sigun.getMerchants().add(this);
	}
	
}
