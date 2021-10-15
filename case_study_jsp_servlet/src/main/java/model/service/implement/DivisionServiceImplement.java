package model.service.implement;

import model.bean.Division;
import model.bean.Position;
import model.responsitory.IDivisionResponsitory;
import model.responsitory.IPostionResponsitory;
import model.responsitory.implement.DivisionResponsitoryImplement;
import model.responsitory.implement.PositionResponsitoryImplement;
import model.service.IDivisionService;

import java.util.List;

public class DivisionServiceImplement implements IDivisionService {
    IDivisionResponsitory iDivisionResponsitory = new DivisionResponsitoryImplement();

    @Override
    public List<Division> findAll() {
        return iDivisionResponsitory.getAll();
    }
}
