package model.service.implement;

import model.bean.CustomerType;
import model.responsitory.ICustomerTypeResponsitory;
import model.responsitory.implement.CustomerTypeResponsitoryImplement;
import model.service.ICustomerTypeService;

import java.util.List;

public class CustomerTypeServiceImplement implements ICustomerTypeService {
    ICustomerTypeResponsitory iCustomerTypeResponsitory = new CustomerTypeResponsitoryImplement();
    @Override
    public List<CustomerType> findAll() {
        return iCustomerTypeResponsitory.getAll();
    }
}
