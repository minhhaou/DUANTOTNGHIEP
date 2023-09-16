package com.fpoly.duantotnghiep.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.duantotnghiep.Entity.CauHoi;
import com.fpoly.duantotnghiep.Entity.TaiLieuKhoaHoc;
import com.fpoly.duantotnghiep.jparepository.CauHoiRepository;
import com.fpoly.duantotnghiep.jparepository.TaiLieuKhoaHocRepository;
import com.fpoly.duantotnghiep.service.CauHoiService;
import com.fpoly.duantotnghiep.service.TaiLieuService;

@Service

public class CauHoiServiceImpl implements CauHoiService {
    @Autowired
    CauHoiRepository cauHoiRepository;

    @Override
    public List<CauHoi> findAll() {
        return cauHoiRepository.findAll();
    }

    @Override
    public List<CauHoi> findByKhoaHocId(int idKhoaHoc) {
        return cauHoiRepository.findByKhoaHocId(idKhoaHoc);
    }

    @Override
    public CauHoi save(CauHoi cauHoi) {
        return cauHoiRepository.save(cauHoi);
    }

}
