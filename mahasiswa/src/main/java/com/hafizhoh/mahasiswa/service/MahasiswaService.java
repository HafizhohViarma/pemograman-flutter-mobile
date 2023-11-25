/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hafizhoh.mahasiswa.service;

import com.hafizhoh.mahasiswa.entity.Mahasiswa;
import com.hafizhoh.mahasiswa.repository.MahasiswaRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author HP 840 G3
 */
@Service
public class MahasiswaService {
    private final MahasiswaRepository mahasiswaRepository;
    @Autowired
    public MahasiswaService(MahasiswaRepository mahasiswaRepository){
        this.mahasiswaRepository = mahasiswaRepository;
    }
    
    public List<Mahasiswa> getAll(){
        return mahasiswaRepository.findAll();
    }
    
    public void insert(Mahasiswa mahasiswa){
        Optional<Mahasiswa> mahasiswaOptional = 
                mahasiswaRepository.findMahasiswaByEmail(mahasiswa.getEmail());
        if(mahasiswaOptional.isPresent()){
            throw new IllegalStateException("Email Sudah Ada");
        }
        mahasiswaRepository.save(mahasiswa);
    }
}
