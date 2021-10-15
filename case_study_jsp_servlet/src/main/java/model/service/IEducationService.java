package model.service;

import model.bean.Education_Degree;

import java.util.List;

public interface IEducationService {
    List<Education_Degree> findAll();
}
