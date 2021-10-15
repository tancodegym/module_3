package model.service;

import model.bean.Customer;
import model.bean.Service;

import java.util.List;

public interface IService {
    List<Service> findAll();

    void save(Service service);

    void remove(String id);

    Service getServiceById(String id);

    void updateService(Service service);

    List<Service> findService(int keySearch, String valueSearch);
}
