package com.fpoly.duantotnghiep.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fpoly.duantotnghiep.Entity.NguoiDung;
import org.springframework.ui.Model;
import com.fpoly.duantotnghiep.jparepository.NguoiDungRepository;

@Controller
public class Login_DangKy {
    @Autowired
    NguoiDungRepository NguoiDung;

    @RequestMapping("/courseOnline/dangky")
    public String showsinupFrom(Model model) {
        model.addAttribute("user", new NguoiDung());
        return "dangky";
    }

    @GetMapping("/courseOnline/dangnhap")
    public String dangnhap() {
        return "dangnhap";
    }

}