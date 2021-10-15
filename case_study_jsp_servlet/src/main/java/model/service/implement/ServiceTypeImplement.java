package model.service.implement;

import model.bean.CustomerType;
import model.bean.ServiceType;
import model.responsitory.ICustomerTypeResponsitory;
import model.responsitory.IServiceTypeResponsitory;
import model.responsitory.implement.CustomerTypeResponsitoryImplement;
import model.responsitory.implement.ServiceTypeResponsitoryImplement;
import model.service.IServiceType;

import java.util.List;

public class ServiceTypeImplement implements IServiceType {
    IServiceTypeResponsitory iServiceTypeResponsitory = new ServiceTypeResponsitoryImplement();
    @Override
    public List<ServiceType> findAll() {
        return iServiceTypeResponsitory.getAll();
    }
}
