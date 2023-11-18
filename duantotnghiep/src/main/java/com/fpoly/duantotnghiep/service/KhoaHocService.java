package com.fpoly.duantotnghiep.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;

public interface KhoaHocService {



	List<KhoaHoc> findAll();

	KhoaHoc findByKhoaHocId(Integer id);

	KhoaHoc findById(int id);

	List<KhoaHoc> getKhoaHocByLoai(String loai);

	KhoaHoc create( KhoaHoc khoaHoc);
}
