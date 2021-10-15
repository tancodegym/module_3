package model.service.implement;

import model.bean.Position;
import model.bean.RentType;
import model.responsitory.IPostionResponsitory;
import model.responsitory.IRentTypeResponsitory;
import model.responsitory.implement.PositionResponsitoryImplement;
import model.responsitory.implement.RentTypeResponsitoryImplement;
import model.service.IPositionService;

import java.util.List;

public class PositionServiceImplement implements IPositionService {
    IPostionResponsitory iPostionResponsitory = new PositionResponsitoryImplement();
    @Override
    public List<Position> findAll() {
        return iPostionResponsitory.getAll();
    }
}
