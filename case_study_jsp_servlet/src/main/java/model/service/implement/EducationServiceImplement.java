package model.service.implement;

import model.bean.Education_Degree;
import model.responsitory.IEducationResponsitory;
import model.responsitory.implement.EducationResponsitoryImplement;
import model.service.IEducationService;

import java.util.List;

public class EducationServiceImplement implements IEducationService {
    IEducationResponsitory iEducationResponsitory = new EducationResponsitoryImplement();
    @Override
    public List<Education_Degree> findAll() {
        return iEducationResponsitory.getAll();
    }
}
