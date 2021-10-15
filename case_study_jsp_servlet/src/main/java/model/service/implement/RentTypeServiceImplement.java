package model.service.implement;

import model.bean.RentType;
import model.responsitory.IRentTypeResponsitory;
import model.responsitory.implement.RentTypeResponsitoryImplement;
import model.service.IRentTypeService;

import java.util.List;

public class RentTypeServiceImplement implements IRentTypeService {
    IRentTypeResponsitory iRentTypeResponsitory = new RentTypeResponsitoryImplement();
    @Override
    public List<RentType> findAll() {
        return iRentTypeResponsitory.getAll();
    }
}
