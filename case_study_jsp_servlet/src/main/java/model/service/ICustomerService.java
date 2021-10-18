package model.service;

import model.bean.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> findAll();
    Map<String, String> save(Customer customer);
    Customer findById(int id);
    void remove(String id);

    Customer getCustomerById(String id);

    Map<String, String> updateCustomer(Customer customer, String customer_id);

    List<String> getPropertyList(Customer customer);

    List<Customer> findCustomer(int keySearch, String valueSearch);

    void removeAll(String allIdCustomer);
}
