package com.fpoly.duantotnghiep.Entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "thanh_toan")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ThanhToan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "id_khoa_hoc")
    private KhoaHoc khoaHoc;

    @ManyToOne
    @JoinColumn(name = "id_nguoi_dung")
    private NguoiDung nguoiDung;

    @Column(name = "tong_tien")
    private float tongTien;

    @Column(name = "thoi_gian")
    private Date thoiGian;

    @Column(name = "trang_thai")
    private boolean trangThai;

    // Constructors, getters, and setters
}
