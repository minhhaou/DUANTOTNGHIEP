package com.fpoly.duantotnghiep.service;

import java.util.List;


import com.fpoly.duantotnghiep.Entity.VideoKhoaHoc;

public interface VideoKhoaHocService {
List<VideoKhoaHoc> findAll();

List<VideoKhoaHoc> findById(int id);
}
