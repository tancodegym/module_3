package model.service.implement;

import model.bean.Customer;
import model.bean.Service;
import model.responsitory.ICustomerResponsitory;
import model.responsitory.IServiceResponsitory;
import model.responsitory.implement.CustomerResponsitoryImplement;
import model.responsitory.implement.ServiceResponsitoryImplement;
import model.service.IService;

import java.util.List;

public class ServiceImplement implements IService {
    private IServiceResponsitory iServiceResponsitory = new ServiceResponsitoryImplement();

    @Override
    public List<Service> findAll() {
        return iServiceResponsitory.findAll();
    }

    @Override
    public void save(Service service) {
        iServiceResponsitory.save(service);
    }

    @Override
    public void remove(String id) {
        iServiceResponsitory.remove(id);
    }

    @Override
    public Service getServiceById(String id) {
        return iServiceResponsitory.getServiceById(id);
    }

    @Override
    public void updateService(Service service) {
        iServiceResponsitory.updateService(service);
    }

    @Override
    public List<Service> findService(int keySearch, String valueSearch) {
        return iServiceResponsitory.findService(keySearch,valueSearch);
    }
}
