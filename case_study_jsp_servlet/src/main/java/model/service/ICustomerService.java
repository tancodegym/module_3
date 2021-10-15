package model.service;

import model.bean.Customer;
import model.bean.Person;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
    void save(Customer customer);
    Customer findById(int id);
    void remove(String id);

    Customer getCustomerById(String id);

    void updateCustomer(Customer customer);

    List<String> getPropertyList(Customer customer);

    List<Customer> findCustomer(int keySearch, String valueSearch);
}
