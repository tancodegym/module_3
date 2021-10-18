package model.service;

import model.bean.CustomerUsing;

import java.util.List;

public interface ICustomerUsingService {
    List<CustomerUsing> findAll();

    void save(CustomerUsing customerUsing);
//    CustomerUsing findById(String customerId);
//    void remove(String id);
//
//    CustomerUsing getCustomerUsingById(String id);
//
//    void updateCustomerUsing(CustomerUsing customerUsing);
//    List<CustomerUsing> findEmployee(int keySearch, String valueSearch);
}
