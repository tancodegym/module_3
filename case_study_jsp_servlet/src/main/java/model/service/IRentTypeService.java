package model.service;

import model.bean.CustomerType;
import model.bean.RentType;

import java.util.List;

public interface IRentTypeService {
    List<RentType> findAll();
}
