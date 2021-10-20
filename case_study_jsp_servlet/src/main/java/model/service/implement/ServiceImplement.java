package model.service.implement;

import model.bean.Customer;
import model.bean.Service;
import model.responsitory.ICustomerResponsitory;
import model.responsitory.IServiceResponsitory;
import model.responsitory.implement.CustomerResponsitoryImplement;
import model.responsitory.implement.ServiceResponsitoryImplement;
import model.service.IService;
import model.service.common.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceImplement implements IService {
    private IServiceResponsitory iServiceResponsitory = new ServiceResponsitoryImplement();

    @Override
    public List<Service> findAll() {
        return iServiceResponsitory.findAll();
    }

    @Override
    public Map<String, String> save(Service service) {
        Map<String, String> mapMessage = new HashMap<>();
        if(Validate.validateName(service.getService_name())!=null||
                Validate.validateArea(service.getService_area())!=null||
                Validate.validateCost(service.getService_cost())!=null||
                Validate.validateMaxPeople(service.getService_max_people())!=null||
                Validate.validatePoolArea(service.getPool_area())!=null||
                Validate.validateNumberOfFloors(service.getNumber_of_floors())!=null){
            mapMessage.put("name",Validate.validateName(service.getService_name()));
            mapMessage.put("area",Validate.validateArea(service.getService_area()));
            mapMessage.put("cost",Validate.validateCost(service.getService_cost()));
            mapMessage.put("maxPeople",Validate.validateMaxPeople(service.getService_max_people()));
            mapMessage.put("poolArea",Validate.validatePoolArea(service.getPool_area()));
            mapMessage.put("numberOfFloor",Validate.validateNumberOfFloors(service.getNumber_of_floors()));
        }else{
            iServiceResponsitory.save(service);
        }
        return  mapMessage;

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
